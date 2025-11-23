package model;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import model.framework.DataAccessObject;

// Objetos persistentes ficam no Model (manipular os atributos da minha tabela no banco de dados)
// representa a tabela usuarios no banco
public class Ingressos extends DataAccessObject{ // herda de DataAccessObject, então pode salvar, atualizar, deletar, etc.
    
    // atributos da tabela ingressos
    private int id;
    private int eventoId;
    private int usuariosId;
    private int quantidade;
    private String data_compra;
    private float valor_total;
    
    
    public Ingressos()
    {
        super("ingresso"); // qual tabela é (nome da tabela)
    }

    // GETS = pega os valores dos atributos
    public int getId() {
        return id;
    }

    public int getEventoId() {
        return eventoId;
    }

    public int getUsuariosId() {
        return usuariosId;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public String getData_compra() {
        return data_compra;
    }

    public float getValor_total() {
        return valor_total;
    }
  
    // quando muda o id, atualiza o valor e marca o campo como alterado (addChange)
    public void setId(int id) {
        this.id = id;
        addChange("id", this.id);
    }

    public void setEventoId(int eventoId) {
        if(this.eventoId != eventoId)
        {
            this.eventoId = eventoId;
            addChange("evento_id", this.eventoId);
        }
        
    }
    
    public void setUsuariosId(int usuariosId) {
        if(this.usuariosId != usuariosId)
        {
            this.usuariosId = usuariosId;
            addChange("usuarios_id", this.usuariosId);
        }
        
    }
    
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
        addChange("quantidade", this.quantidade);
    }
    
    public void setDataCompra(String data_compra) {
        this.data_compra = data_compra;
        addChange("data_compra", this.data_compra);
    }
    
    public void setValorTotal(float valor_total) { 
        this.valor_total = valor_total;
        addChange("valor_total", this.valor_total);

    }

    // diz como achar esse ingresso específico no banco: WHERE id = valor
    @Override
    protected String getWhereClauseForOneEntity()
    {
        return " id = " + getId();
    }

    // preenche o objeto ingresso com os dados do banco
    @Override
    protected DataAccessObject fill(ArrayList<Object> data) {
        // segue a ordem das colunas da tabela no banco de do banco de dados
        id = (int) data.get(0);
        eventoId = (int) data.get(1);
        usuariosId = (int) data.get(2);
        quantidade = (int) data.get(3);
        
        if(data.get(4) != null){
            data_compra = data.get(4).toString();
        }
        else
        {
            data_compra = null;
        }
        
        valor_total = (float) data.get(5);
 
        return this;
    }

    @Override
    public String toString() {
        return "(" + getId() + ", " + getEventoId()+ ", " + getUsuariosId()+ ", " + getQuantidade()+ ", " + getData_compra()+ ", " + getValor_total() + ")";
    }
    
    // cria uma cópia desse objeto, preenche os mesmos valores, marca como não novo (já veio do banco) e retorna a cópia
    @Override
    protected Ingressos copy() { // o copy() serve pra não deixar tudo grudado na mesma referência
        // sem o copy todo item da lista iria ser igual pqe aponta para o mesmo objeto na memória
        // com o copy cada vez que você coloca o item na lista, ele cria um clone independente
        // então com isso cada posição guarda o seu próprio valor e não fica copiando o último que foi carregado
        Ingressos u = new Ingressos();
        
        u.setId(getId());
        u.setEventoId(getEventoId());
        u.setUsuariosId(getUsuariosId());
        u.setQuantidade(getQuantidade());
        u.setDataCompra(getData_compra());
        u.setValorTotal(getValor_total());
        
        // marca como não novo
        u.setNovelEntity(false); // assume que o objeto copiado já existe no banco de dados
        
        return u;
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Ingressos)
        {
            Ingressos aux = (Ingressos) obj;
            
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

   

    

    
    
    

