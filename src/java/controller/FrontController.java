package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logtrack.ExceptionLogTrack;
import model.Categorias;
import model.Eventos;
import model.Ingressos;
import model.Privilegios;
import model.Usuarios;

public class FrontController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String task = request.getParameter("task");
        
        if (task == null)
        {
            task = "";
        }
        
        try{
            switch (task) {
                case "privilegios": doGetPrivilegios(request, response);
                    break;

                case "usuarios": doGetUsuarios(request, response);
                    break;
                    
                case "eventos": doGetEventos(request, response);
                    break;
                    
                case "ingressos": doGetIngressos(request, response);
                    break;
                    
                case "categorias": doGetCategorias(request, response);
                    break;
                
                case "logout": doGetLogout(request, response);
                    break;
                    
                default:
                    doDefault(request, response);
            }
        }
        catch(Exception ex)
        {
            ExceptionLogTrack.getInstance().addLog(ex);
        }
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String task = request.getParameter("task");
        
        if (task == null)
        {
            task = "";
        }
        
        try{
            switch (task) {
                case "privilegios": doPostPrivilegios(request, response);
                    break;

                case "usuarios": doPostUsuarios(request, response);
                    break;
                    
                case "ingressos": doPostIngressos(request, response);
                    break;
                    
                case "eventos": doPostEventos(request, response);
                    break;
                    
                case "categorias": doPostCategorias(request, response);
                    break;
                
                case "login": doPostLogin(request, response);
                    break;
                    
                default:
                    doDefault(request, response);
            }
        }
        catch(Exception ex)
        {
            ExceptionLogTrack.getInstance().addLog(ex);
        }
        
    }
    
    private void doGetPrivilegios(HttpServletRequest request, HttpServletResponse response ) throws Exception
    {
        // É responsável por 2 funções, obter a listagem de registros da tabela privilegios e deletar um registro da tabela privilegios 
        
        String action = request.getParameter("action");
        
        if ((action != null) && (action.equals("delete")))
        {
            int id = Integer.valueOf(request.getParameter("id"));
            
            Privilegios pl = new Privilegios();
            pl.setId(id);
            
            
            pl.delete();
            
        }
        
        response.sendRedirect(request.getContextPath() + "/home/app/adm/privilegios.jsp"); // vai listar os privilegios existentes
    }
    
    private void doGetCategorias(HttpServletRequest request, HttpServletResponse response ) throws Exception
    {
        // É responsável por 2 funções, obter a listagem de registros da tabela categorias e deletar um registro da tabela categorias 
        
        String action = request.getParameter("action");
        
        if ((action != null) && (action.equals("delete")))
        {
            int id = Integer.valueOf(request.getParameter("id"));
            
            Categorias u = new Categorias();
            u.setId(id);
            
            
            u.delete();
            
        }
        
        response.sendRedirect(request.getContextPath() + "/home/app/ger/categorias.jsp"); // vai listar as categorias existentes
    }
    
    private void doGetEventos(HttpServletRequest request, HttpServletResponse response ) throws Exception
    {
        // É responsável por 2 funções, obter a listagem de registros da tabela evento e deletar um registro da tabela evento 
        String action = request.getParameter("action");
        
        if ((action != null) && (action.equals("delete")))
        {
            int id = Integer.valueOf(request.getParameter("id"));
            
            Eventos cv = new Eventos();
            cv.setId(id);
            
            
            cv.delete();
            
        }
        
        response.sendRedirect(request.getContextPath() + "/home/app/ger/eventos.jsp"); // vai listar os eventos existentes
    }
    
    private void doGetUsuarios(HttpServletRequest request, HttpServletResponse response ) throws Exception
    {
        // É responsável por 2 funções, obter a listagem de registros da tabela usuarios e deletar um registro da tabela usuarios 
        String action = request.getParameter("action");
        
        if ((action != null) && (action.equals("delete")))
        {
            int id = Integer.valueOf(request.getParameter("id"));
            
            Usuarios cv = new Usuarios();
            cv.setId(id);
            
            
            cv.delete();
            
        }
        
        response.sendRedirect(request.getContextPath() + "/home/app/adm/usuarios.jsp"); // vai listar os usuarios existentes
    }
    
    private void doGetIngressos(HttpServletRequest request, HttpServletResponse response ) throws Exception
    {
        // É responsável por 2 funções, obter a listagem de registros da tabela convenios e deletar um registro da tabela convenios 
        String action = request.getParameter("action");
        
        if ((action != null) && (action.equals("delete")))
        {
            int id = Integer.valueOf(request.getParameter("id"));
            
            Ingressos ct = new Ingressos();
            ct.setId(id);
            
            
            ct.delete();
            
        }
        
        response.sendRedirect(request.getContextPath() + "/home/app/cmp/ingressos.jsp"); // vai listar as categorias existentes
    }
    
    private void doGetLogout(HttpServletRequest request, HttpServletResponse response ) throws Exception
    {
        HttpSession sessao = request.getSession(false);
        
        if (sessao != null)
        {
            sessao.removeAttribute("usuarios");
            sessao.removeAttribute("privilegios");
            
            sessao.invalidate();
        }
        
        
        response.sendRedirect(request.getContextPath() + "/home/login.jsp"); 
    }

    
    private void doPostPrivilegios(HttpServletRequest request, HttpServletResponse response ) throws Exception
    {
        // criar e alterar registros 
        
        String action = request.getParameter("action");
        
        int id = Integer.valueOf(request.getParameter("id"));
        String descricao = request.getParameter("descricao");
        String nome = request.getParameter("nome");
        String moduloEventos = request.getParameter("modulo_eventos");
        
        if(moduloEventos == null)
        {
            moduloEventos = "N";
        }
        
        String moduloIngressos = request.getParameter("modulo_ingressos");
        if(moduloIngressos == null)
        {
            moduloIngressos = "N";
        }
        
        String moduloUsuarios = request.getParameter("modulo_usuarios");
        if(moduloUsuarios == null)
        {
            moduloUsuarios = "N";
        }
        
        
        // Java Bean
        Privilegios pl = new Privilegios();

        pl.setId(id);

        if(action.equals("update"))
        {
            pl.load();
        }

        pl.setNome(nome);
        pl.setDescricao(descricao);
        pl.setModuloEventos(moduloEventos);
        pl.setModuloIngressos(moduloIngressos);
        pl.setModuloUsuarios(moduloUsuarios);


        pl.save();
        
        
        response.sendRedirect(request.getContextPath() + "/home/app/adm/privilegios.jsp"); // vai listar os privilegios existentes
    
    }
    
    private void doPostUsuarios(HttpServletRequest request, HttpServletResponse response ) throws Exception
    {
        // criar e alterar registros 
        
        String action = request.getParameter("action");
        int id = Integer.valueOf(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        int privilegios_id = Integer.valueOf(request.getParameter("privilegios_id"));
        
        // Java Bean
        Usuarios u = new Usuarios();

        u.setId(id);

        if(action.equals("update"))
        {
            u.load();
        }

        u.setNome(nome);
        u.setEmail(email);
        u.setSenha(senha);
        u.setPrivilegiosId(privilegios_id);
        
        u.save();
        
        response.sendRedirect(request.getContextPath() + "/home/app/adm/usuarios.jsp"); // vai listar os usuarios existentes
    }
    
    private void doPostEventos(HttpServletRequest request, HttpServletResponse response ) throws Exception
    {
        // criar e alterar registros 
        
        String action = request.getParameter("action");
        
        int id = Integer.valueOf(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String local = request.getParameter("local");
        String data_evento = request.getParameter("data_evento");
        float preco = Float.valueOf(request.getParameter("preco"));
        int capacidade_maxima = Integer.valueOf(request.getParameter("capacidade_maxima"));
        String descricao = request.getParameter("descricao");
        int categorias_id = Integer.valueOf(request.getParameter("categorias_id"));
        
        
        // Java Bean
        Eventos cv = new Eventos();

        cv.setId(id);

        if(action.equals("update"))
        {
            cv.load();
        }

        cv.setNome(nome);
        cv.setLocal(local);
        cv.setDataEvento(data_evento);
        cv.setPreco(preco);
        cv.setCapacidadeMaxima(capacidade_maxima);
        cv.setDescricao(descricao);
        cv.setCategoriasId(categorias_id);


        cv.save();
        
        response.sendRedirect(request.getContextPath() + "/home/app/ger/eventos.jsp"); // vai listar os convenios existentes
    }
    
    private void doPostCategorias(HttpServletRequest request, HttpServletResponse response ) throws Exception
    {
        // criar e alterar registros 
        
        String action = request.getParameter("action");
        
        int id = Integer.valueOf(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        
        
        // Java Bean
        Categorias ex = new Categorias();

        ex.setId(id);

        if(action.equals("update"))
        {
            ex.load();
        }

        ex.setNome(nome);
        ex.setDescricao(descricao);

        ex.save();
        
        response.sendRedirect(request.getContextPath() + "/home/app/ger/categorias.jsp"); // vai listar os exames existentes
    }
    
    private void doPostIngressos(HttpServletRequest request, HttpServletResponse response ) throws Exception
    {
        // criar e alterar registros 
        
        String action = request.getParameter("action");
        
        int id = Integer.valueOf(request.getParameter("id"));
        int evento_id = Integer.valueOf(request.getParameter("evento_id"));
        int usuarios_id = Integer.valueOf(request.getParameter("usuarios_id"));
        int quantidade = Integer.valueOf(request.getParameter("quantidade"));
        String data_compra = request.getParameter("data_compra");
        float valor_total = Float.valueOf(request.getParameter("valor_total"));
        
        // Java Bean
        Ingressos ex = new Ingressos();

        ex.setId(id);

        if(action.equals("update"))
        {
            ex.load();
        }
        
        ex.setEventoId(evento_id);
        ex.setUsuariosId(usuarios_id);
        ex.setQuantidade(quantidade);

        if( data_compra.equals("") ) {
            ex.setDataCompra(null);
        } else {
            ex.setDataCompra(data_compra);
        }

        ex.setValorTotal(valor_total);

        ex.save();
        
        response.sendRedirect(request.getContextPath() + "/home/app/cmp/ingressos.jsp"); // vai listar os ingressos existentes
    }
    
    private void doPostLogin(HttpServletRequest request, HttpServletResponse response ) throws Exception
    {   
        int id = Integer.valueOf(request.getParameter("id"));
        String senha = request.getParameter("senha");
      
        Usuarios usuarioTry = new Usuarios();
        usuarioTry.setId(id);
        usuarioTry.setSenha(senha);
        
        Usuarios usuarios = new Usuarios();
        usuarios.setId(id);
        boolean status = usuarios.load();
        
//        System.out.println("Usuário carregado do banco: " + status);
//        
//        if(status) {
//            System.out.println("Hash no banco: " + usuarios.getSenha());
//            System.out.println("Hash da senha informada: " + usuarioTry.getSenha());
//            System.out.println("Hashes iguais? " + usuarios.getSenha().equals(usuarioTry.getSenha()));
//        }
        
        if((status == true) && (usuarios.getSenha().equals(usuarioTry.getSenha())))
        { // Se for as senhas forem iguais (hash), loga
            
            // true cria uma sessão, se não houver alguma
            // informações armazenadas no servidor
            HttpSession sessao = request.getSession(false);
            
            if(sessao != null)
            {
                // Se a sessão já existir
                
                sessao.removeAttribute("usuarios");
                sessao.removeAttribute("privilegios");
                
                sessao.invalidate();
            }
            
            sessao = request.getSession(true);
            
            sessao.setAttribute("usuarios", "(" + usuarios.getNome()  + ", "  +  usuarios.getId() + ")");
            
            Privilegios privilegios = new Privilegios();
            privilegios.setId(usuarios.getPrivilegiosId());
            privilegios.load();
            
            sessao.setAttribute("privilegios", privilegios);
            
            sessao.setMaxInactiveInterval(60 * 60); // segundos
            
            // criado e armazenado no cliente
            Cookie cookieId = new Cookie("id", String.valueOf(id));
            
            cookieId.setMaxAge(60 * 10); // em segundos
            
            response.addCookie(cookieId);
            
            // faz com que o cliente acesse o recurso
            response.sendRedirect(request.getContextPath() + "/home/app/menu.jsp"); 
        }
        else
        {
            request.setAttribute("msg", "ID e/ou Senha Incorreto(s)");
            // faz com que o servidor acesse o recurso
            request.getRequestDispatcher("/home/login.jsp").forward(request, response);
        }
      
    }
    
    private void doDefault(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException
    {
        response.sendRedirect(request.getContextPath() + "/home/login.jsp");
    }

}
