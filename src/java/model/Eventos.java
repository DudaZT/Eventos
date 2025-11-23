package model;

import java.util.ArrayList;
import model.framework.DataAccessObject;

// Objetos persistentes ficam no Model (manipular os atributos da minha tabela no banco de dados)
// representa a tabela convenios no banco
public class Eventos extends DataAccessObject{ // herda de DataAccessObject, então pode salvar, atualizar, deletar, etc.
    
    // atributos da tabela convenios
    private int id;
    private String nome;
    private String local;
    private String data_evento;
    private float preco;
    private int capacidade_maxima;
    private String descricao;
    private int categorias_id;
    
    public Eventos()
    {
        super("evento"); // qual tabela é (nome da tabela)
    }

    // GETS = pega os valores dos atributos
    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getLocal() {
        return local;
    }

    public String getDataEvento() {
        return data_evento;
    }

    public float getPreco() {
        return preco;
    }

    public int getCapacidadeMaxima() {
        return capacidade_maxima;
    }

    public String getDescricao() {
        return descricao;
    }

    public int getCategoriasId() {
        return categorias_id;
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

    public void setLocal(String local) {
        this.local = local;
        addChange("local", this.local);
    }
    
    public void setDataEvento(String data_evento) {
        this.data_evento = data_evento;
        addChange("data_evento", this.data_evento);
    }

    public void setPreco(float preco) {
        
        this.preco = preco;
        addChange("preco", this.preco);

        
    }
    
    public void setCapacidadeMaxima(int capacidade_maxima) {
        this.capacidade_maxima = capacidade_maxima;
        addChange("capacidade_maxima", this.capacidade_maxima);
    }
    
    public void setDescricao(String descricao) {
        this.descricao = descricao;
        addChange("descricao", this.descricao);
    }
    
    public void setCategoriasId(int categorias_id) {
        if(this.categorias_id != categorias_id)
        {
            this.categorias_id = categorias_id;
            addChange("categorias_id", this.categorias_id);
        }
        
    }
    
    // diz como achar esse usuário específico no banco: WHERE id = valor
    @Override
    protected String getWhereClauseForOneEntity()
    {
        return " id = " + getId();
    }

    // preenche o objeto Convenios com os dados do banco
    @Override
    protected DataAccessObject fill(ArrayList<Object> data) {
        // segue a ordem das colunas da tabela no banco de do banco de dados
        id = (int) data.get(0);
        nome = (String) data.get(1);
        local = (String) data.get(2);
        
        if( data.get(3) != null ) {
            data_evento = data.get(3).toString();
        } else {
            data_evento = null;
        }

        preco = (float) data.get(4);
        capacidade_maxima = (int) data.get(5);
        descricao = (String) data.get(6);
        categorias_id = (int) data.get(7);
        
        return this;
    }

    @Override
    public String toString() {
        return "(" + getId() + ", " + getNome() + ", " + getLocal()+ ", " + getDataEvento() + ", " + getPreco() + ", " + getCapacidadeMaxima() + ", " + getDescricao()+ ", " + getCategoriasId()+ ")";
    }
    
    // cria uma cópia desse objeto, preenche os mesmos valores, marca como não novo (já veio do banco) e retorna a cópia
    @Override
    protected Eventos copy() { // o copy() serve pra não deixar tudo grudado na mesma referência
        // sem o copy todo item da lista iria ser igual pqe aponta para o mesmo objeto na memória
        // com o copy cada vez que você coloca o item na lista, ele cria um clone independente
        // então com isso cada posição guarda o seu próprio valor e não fica copiando o último que foi carregado
        Eventos cv = new Eventos();
        
        cv.setId(getId());
        cv.setNome(getNome());
        cv.setLocal(getLocal());
        cv.setDataEvento(getDataEvento());
        cv.setPreco(getPreco());
        cv.setCapacidadeMaxima(getCapacidadeMaxima());
        cv.setDescricao(getDescricao());
        cv.setCategoriasId(getCategoriasId());
        
        // marca como não novo
        cv.setNovelEntity(false); // assume que o objeto copiado já existe no banco de dados
        
        return cv;
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Eventos)
        {
            Eventos aux = (Eventos) obj;
            
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

