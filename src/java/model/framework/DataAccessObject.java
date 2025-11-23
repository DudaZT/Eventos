package model.framework;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import controller.AppConfig;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringJoiner;

public abstract class DataAccessObject {
    private String tableEntity; // nome da tabela no banco
    private boolean novelEntity; // se é um registro novo (ainda não salvo)
    private boolean changedEntity; // se o registro foi alterado
    private HashMap<String, Object> dirtyFields; // campo que foi alterado (sujo)
    
    public DataAccessObject(String tableEntity)
    {
        setTableEntity(tableEntity); // recebe o nome da tabela
        dirtyFields = new HashMap<>(); // inicializa o dirtyFields
        setNovelEntity(true); // marca como novo 
        setChangedEntity(false); // marca como não alterado
    }
    
    // retorna o nome da tabela
    private String getTableEntity() {
        return tableEntity;
    }
    
    // retorna se o registro é novo
    private boolean isNovelEntity() {
        return novelEntity;
    }
    
    // retorna se o registro foi alterado
    private boolean isChangedEntity() {
        return changedEntity;
    }

    // define a tabela, se o nome da tabela for inválido (nulo ou vazio), dá erro
    private void setTableEntity(String tableEntity) {
        if(tableEntity != null && !tableEntity.isEmpty() && !tableEntity.isBlank())
        {
            this.tableEntity = tableEntity;
        }
        else
        {
            throw new IllegalArgumentException("table must be valid");
        }
    }

    // permite mudar o status de "novo"
    protected void setNovelEntity(boolean novelEntity) {
        this.novelEntity = novelEntity;
    }
    
    // atualiza se o objeto está alterado, se marcar como não alterado, limpa os campos "sujos"
    protected void setChangedEntity(boolean changedEntity) {
        this.changedEntity = changedEntity;
        
        if(this.changedEntity == false)
        {
            dirtyFields.clear();
        }
    }
    
    // Unity of work
    // adiciona uma alteração em um campo, coloca no dirtyFields e marca o objeto como alterado
    protected void addChange(String field, Object value)
    {
        dirtyFields.put(field, value);
        setChangedEntity(true);
    }
    
    private void insert() throws SQLException
    {
        String dml = "INSERT INTO " + getTableEntity(); // monta o comando SQL de inserção
        
        StringJoiner fields = new StringJoiner(", "); // junta os nomes dos campos e os ? (valores a preencher)
        StringJoiner values = new StringJoiner(", ");
        
        // pra cada campo alterado adiciona no fields e coloca um ? nos values
        for(String field: dirtyFields.keySet()) // field = coluna da tabela | dirtyFields.get(field) = dados da coluna
        {
            fields.add(field);
            values.add("?");
        }
        
        dml += " (" + fields + ") VALUES (" + values + ")";
        
        // printa o comando no terminal para debug
        if(AppConfig.getInstance().isVerbose())
        {
            System.out.println(dml);
        }
            
        // abre a conexão com o banco e prepara o comando SQL
        Connection con = DataBaseConnections.getInstance().getConnection();
        PreparedStatement pst = con.prepareStatement(dml);
        
        // pra cada campo, substitui o ? pelo valor correto
        int index = 1;
        
        for(String field: dirtyFields.keySet())
        {
            pst.setObject(index, dirtyFields.get(field)); // Index = substitui o primeiro ponto de interrogação a ser substituído
            index++;
        }
        
        // printa o comando no terminal para debug
        if(AppConfig.getInstance().isVerbose())
        {
            System.out.println(pst);
        }
        
        // executa o INSERT, fecha tudo e encerra a conexão
        pst.execute();
        pst.close();

        DataBaseConnections.getInstance().closeConnection(con);
    }
    
    private void update() throws SQLException
    {
        // monta o UPDATE
        String dml = "UPDATE " + getTableEntity() + " SET ";
        
        StringJoiner changes = new StringJoiner(", ");
        
        // pra cada campo alterado, coloca campo = ?
        for(String field: dirtyFields.keySet())
        {
            changes.add(field + " = ?");
        }
        
        // monta o SQL com WHERE para achar o registro certo (id)
        dml += changes + " WHERE" + getWhereClauseForOneEntity();
        
        if(AppConfig.getInstance().isVerbose())
        {
            System.out.println(dml);
        }
        
        Connection con = DataBaseConnections.getInstance().getConnection();
        PreparedStatement pst = con.prepareStatement(dml);
        
        int index = 1;
        
        for(String field: dirtyFields.keySet())
        {
            pst.setObject(index, dirtyFields.get(field)); // Index = substitui os pontos de interrogações
            index++;
        }
        
        if(AppConfig.getInstance().isVerbose())
        {
            System.out.println(pst);
        }
        
        pst.execute();
        pst.close();

        DataBaseConnections.getInstance().closeConnection(con);
    }
    
    public void save() throws SQLException
    {
        if(isChangedEntity()) // verifica se foi alterada
        {
            if(isNovelEntity()) // é uma entidade nova?
            {
                insert(); // insere
                setNovelEntity(false); // como já foi inserido não é mais novo
            }
            else // não é nova
            {
                update(); // atualiza
            }
            setChangedEntity(false); // não se encontra mais alterados
        }
    }
    
    public void delete() throws SQLException
    {
        // monta o comando delete
        String dml = "DELETE FROM " + getTableEntity() + " WHERE" + getWhereClauseForOneEntity();
        
        if(AppConfig.getInstance().isVerbose())
        {
            System.out.println(dml);
        }
        
        // conexão com o banco
        Connection con = DataBaseConnections.getInstance().getConnection();
        
        Statement st = con.createStatement();
        
        // 
        st.execute(dml);
        st.close();
        
        DataBaseConnections.getInstance().closeConnection(con);
    }
    
    public boolean load() throws SQLException
    {
        boolean resultado;
        
        // monta o comando sql
        String dql = "SELECT * FROM " + getTableEntity() + " WHERE" + getWhereClauseForOneEntity();
        
        if(AppConfig.getInstance().isVerbose())
        {
            System.out.println(dql);
        }
        
        // executa a consulta e verifica se achou algum registro
        Connection con = DataBaseConnections.getInstance().getConnection();
        
        Statement st = con.createStatement();
        
        ResultSet rs = st.executeQuery(dql);
        
        resultado = rs.next();
        
        // se achou algum registro, pega os dados da linha, chama fill() (para preencher o objeto) e marca como não novo (sujo)
        if( resultado)
        {
            ArrayList<Object> data = new ArrayList();
            
            
            for(int i = 1; i <= rs.getMetaData().getColumnCount(); i++)
            {
                data.add(rs.getObject(i));
            }
            
            fill(data);
            
            setNovelEntity(false);
            setChangedEntity(false);
        }
        
        return resultado;
    }
    
    // pega todos os registros da tabela
    public <T extends DataAccessObject> ArrayList<T> getAllTableEntities() throws SQLException
    {
        ArrayList<T> result = new ArrayList<>();
        
        String dql = "SELECT * FROM " + getTableEntity();
        
        if(AppConfig.getInstance().isVerbose())
        {
            System.out.println(dql);
        }
        
        Connection con = DataBaseConnections.getInstance().getConnection();
        
        Statement st = con.createStatement();
        
        ResultSet rs = st.executeQuery(dql);
        
        // pra cada linha pega os valores, chama fill() para preencher o objeto e adiciona uma cópia na lista
        while(rs.next())
        {
            ArrayList<Object> data = new ArrayList<>();
            
            for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++)
            {
                data.add(rs.getObject(i));
                
            }
            
            result.add(fill(data).copy());

        }
        
        
        st.close();
        
        DataBaseConnections.getInstance().closeConnection(con);
        
        // retorna os registros
        return result;
    }
    
    // padrão Template Methods
    protected abstract String getWhereClauseForOneEntity(); // como identificar o registro (WHERE id = ...)
    protected abstract DataAccessObject fill(ArrayList<Object> data); // preenche os atributos do objeto com dados do banco
    protected abstract <T extends DataAccessObject> T copy(); // cria uma cópia do objeto

    @Override
    public boolean equals(Object obj) {
        throw new RuntimeException("equals must be Overrided");
    }
    
    
}
