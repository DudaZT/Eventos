package model;

import java.util.ArrayList;
import model.framework.DataAccessObject;

// Objetos persistentes ficam no Model (manipular os atributos da minha tabela no banco de dados)
public class Privilegios extends DataAccessObject{
    private int id;
    private String nome;
    private String descricao;
    private String moduloEventos;
    private String moduloIngressos;
    private String moduloUsuarios;
    
    public Privilegios()
    {
        super("privilegios"); // qual tabela é (nome da tabela)
    }
    
    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }
    
    public String getDescricao() {
        return descricao;
    }

    public String getModuloEventos() {
        return moduloEventos;
    }

    public String getModuloIngressos() {
        return moduloIngressos;
    }

    public String getModuloUsuarios() {
        return moduloUsuarios;
    }

    public void setId(int id) {
        this.id = id;
        addChange("id", this.id);
    }

    public void setNome(String nome) {
        this.nome = nome;
        addChange("nome", this.nome);
    }
    
    public void setDescricao(String descricao) {
        this.descricao = descricao;
        addChange("descricao", this.descricao);
    }

    public void setModuloEventos(String moduloEventos) {
        this.moduloEventos = moduloEventos;
        addChange("modulo_eventos", this.moduloEventos);
    }

    public void setModuloIngressos(String moduloIngressos) {
        this.moduloIngressos = moduloIngressos;
        addChange("modulo_ingressos", this.moduloIngressos);
    }

    public void setModuloUsuarios(String moduloUsuarios) {
        this.moduloUsuarios = moduloUsuarios;
        addChange("modulo_usuarios", this.moduloUsuarios);
    }
    
    @Override
    protected String getWhereClauseForOneEntity()
    {
        return " id = " + getId();
    }

    @Override
    protected DataAccessObject fill(ArrayList<Object> data) {
        // segue a ordem das colunas da tabela no banco de do banco de dados
        id = (int) data.get(0);
        nome = (String) data.get(1);
        descricao = (String) data.get(2);
        moduloEventos = (String) data.get(3);
        moduloIngressos = (String) data.get(4);
        moduloUsuarios = (String) data.get(5);
        
        return this;
    }
    
    @Override
    public String toString() {
        return "(" + getId() + ", " + getNome() + ", " + getDescricao() + ", " + getModuloEventos() + ", " + getModuloIngressos() + ", " + getModuloUsuarios() + ")";
    }

    @Override
    protected Privilegios copy() {
        Privilegios cp = new Privilegios();
        
        cp.setId(getId());
        cp.setNome(getNome());
        cp.setDescricao(getDescricao());
        cp.setModuloEventos(getModuloEventos());
        cp.setModuloIngressos(getModuloIngressos());
        cp.setModuloUsuarios(getModuloUsuarios());
        
        cp.setNovelEntity(false);
        
        return cp;
    }

    
    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Privilegios)
        {
            Privilegios aux = (Privilegios) obj;
            
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
