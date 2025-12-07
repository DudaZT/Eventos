package model;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import model.framework.DataAccessObject;

// Objetos persistentes ficam no Model (manipular os atributos da minha tabela no banco de dados)
// representa a tabela usuarios no banco
public class Usuarios extends DataAccessObject{ // herda de DataAccessObject, então pode salvar, atualizar, deletar, etc.
    
    // atributos da tabela usuarios
    private int id;
    private String nome;
    private String email;
    private String senha;
    private int privilegiosId;
    
    public Usuarios()
    {
        super("usuarios"); // qual tabela é (nome da tabela)
    }

    // GETS = pega os valores dos atributos
    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }
    
    public String getEmail() {
        return email;
    }

    public String getSenha() {
        return senha;
    }

    public int getPrivilegiosId() {
        return privilegiosId;
    }
    
    // quando muda o id, atualiza o valor e marca o campo como alterado (addChange)
    public void setId(int id) {
        this.id = id;
        addChange("id", this.id);
    }

    // cada vez que um atributo muda, ele é marcado como "sujo" fazendo com que o save() da superclasse saiba salvar no banco
    public void setNome(String nome) {
        this.nome = nome;
        addChange("nome", this.nome);
    }
    
    public void setEmail(String email) {
        this.email = email;
        addChange("email", this.email);
    }


    public void setSenha(String senha) throws Exception{
        
        if(senha == null)
        {
            if(this.senha != null)
            {
                this.senha = senha;
                addChange("senha", this.senha);
            }
        }
        else
        {
            if(senha.equals(this.senha) == false)
            {
                String senhaSal = getId() + senha + getId()/2;
                
                MessageDigest md = MessageDigest.getInstance("SHA-512");
                String hash = new BigInteger( 1, md.digest( senhaSal.getBytes("UTF-8"))).toString(16);
                
                this.senha = hash;
                addChange("senha", this.senha);
            }
        }
        

    }

    public void setPrivilegiosId(int privilegiosId) {
        if(this.privilegiosId != privilegiosId)
        {
            this.privilegiosId = privilegiosId;
            addChange("privilegios_id", this.privilegiosId);
        }
        
    }

    // diz como achar esse usuário específico no banco: WHERE id = valor
    @Override
    protected String getWhereClauseForOneEntity()
    {
        return " id = " + getId();
    }

    // preenche o objeto Usuario com os dados do banco
    @Override
    protected DataAccessObject fill(ArrayList<Object> data) {
        // segue a ordem das colunas da tabela no banco de do banco de dados
        id = (int) data.get(0);
        nome = (String) data.get(1);
        email = (String) data.get(2);
        senha = (String) data.get(3);
        privilegiosId = (int) data.get(4);
        
        return this;
    }

    @Override
    public String toString() {
        return "(" + getId() + ", " + getNome() + ", " + getSenha() + ", " + getEmail()+ ", " + getPrivilegiosId() + ")";
    }
    
    // cria uma cópia desse objeto, preenche os mesmos valores, marca como não novo (já veio do banco) e retorna a cópia
    @Override
    protected Usuarios copy() { // o copy() serve pra não deixar tudo grudado na mesma referência
        // sem o copy todo item da lista iria ser igual pqe aponta para o mesmo objeto na memória
        // com o copy cada vez que você coloca o item na lista, ele cria um clone independente
        // então com isso cada posição guarda o seu próprio valor e não fica copiando o último que foi carregado
        Usuarios u = new Usuarios();
        
        u.setId(getId());
        u.setNome(getNome());
        u.setEmail(getEmail());
        u.senha = getSenha();
        u.setPrivilegiosId(getPrivilegiosId());
        
        // marca como não novo
        u.setNovelEntity(false); // assume que o objeto copiado já existe no banco de dados
        
        return u;
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Usuarios)
        {
            Usuarios aux = (Usuarios) obj;
            
            if(getId() == aux.getId())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }
    
    
}

   

    

    
    
    

