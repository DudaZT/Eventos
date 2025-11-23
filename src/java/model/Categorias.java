package model;

import java.util.ArrayList;
import model.framework.DataAccessObject;

// Objetos persistentes ficam no Model (manipular os atributos da minha tabela no banco de dados)
// representa a tabela convenios no banco
public class Categorias extends DataAccessObject{ // herda de DataAccessObject, então pode salvar, atualizar, deletar, etc.
    
    // atributos da tabela convenios
    private int id;
    private String nome;
    private String descricao;
    
    public Categorias()
    {
        super("categorias"); // qual tabela é (nome da tabela)
    }

    // GETS = pega os valores dos atributos
    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getDescricao() {
        return descricao;
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

    public void setDescricao(String descricao) {
        this.descricao = descricao;
        addChange("descricao", this.descricao);
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
        descricao = (String) data.get(2);
        
        return this;
    }

    @Override
    public String toString() {
        return "(" + getId() + ", " + getNome() + ", " + getDescricao() + ")";
    }
    
    // cria uma cópia desse objeto, preenche os mesmos valores, marca como não novo (já veio do banco) e retorna a cópia
    @Override
    protected Categorias copy() { // o copy() serve pra não deixar tudo grudado na mesma referência
        // sem o copy todo item da lista iria ser igual pqe aponta para o mesmo objeto na memória
        // com o copy cada vez que você coloca o item na lista, ele cria um clone independente
        // então com isso cada posição guarda o seu próprio valor e não fica copiando o último que foi carregado
        Categorias cv = new Categorias();
        
        cv.setId(getId());
        cv.setNome(getNome());
        cv.setDescricao(getDescricao());
        
        // marca como não novo
        cv.setNovelEntity(false); // assume que o objeto copiado já existe no banco de dados
        
        return cv;
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Categorias)
        {
            Categorias aux = (Categorias) obj;
            
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

