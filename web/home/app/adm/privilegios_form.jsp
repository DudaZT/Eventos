<%-- 
    Document   : tipousuario_form
    Created on : 2 de out. de 2025, 08:48:16
    Author     : aluno
--%>

<%@page import="model.Privilegios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <title>Formulário Privilégios</title>
    </head>
    <body class="container-fluid">
        <%@ include file="/home/app/modulos.jsp" %>
        <% 
            Privilegios tp = null;
            
            String action = request.getParameter("action");
            
            if(action == null)
            {
                action = "create";
            }
            else
            {
                if(action.equals("update"))
                {
                    int id = Integer.valueOf(request.getParameter("id"));
                    
                    tp = new Privilegios();
                    tp.setId(id);
                    tp.load();
                }
            }
        %>
        <h1 class="mt-5">Formulário Privilégios</h1>
        
        <form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=privilegios" method="post">

            <label for="id">ID: </label>
            <input type="text" id="id" name="id" pattern="\d+" title="Apenas Dígitos" value="<%= (tp != null) ? tp.getId() : "" %>" <%= (tp != null) ? "readonly" : "" %> required/> <br/> <br/>
                
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name ="nome" value="<%= ((tp != null) && (tp.getNome() != null)) ? tp.getNome() : ""%>" required><br/><br/>
            
            <label for="descricao">Descrição:</label>
            <textarea id="descricao" name="descricao" rows="4" cols="50"><%= ((tp != null) && (tp.getDescricao() != null)) ? tp.getDescricao() : ""%></textarea><br/> <br/>  
            
            <input type="checkbox" id="modulo_eventos" name="modulo_eventos" value = "S" <%= ((tp != null) && (tp.getModuloEventos().equals("S"))) ? "checked" : "" %>>
            <label for="modulo_eventos">Módulo Eventos</label> <br/> <br/>
           
            <input type="checkbox" id="modulo_ingressos" name="modulo_ingressos" value = "S" <%= ((tp != null) && (tp.getModuloIngressos().equals("S"))) ? "checked" : "" %>>
            <label for="modulo_ingressos">Módulo Ingressos</label> <br/> <br/>
            
            <input type="checkbox" id="modulo_usuarios" name="modulo_usuarios" value = "S" <%= ((tp != null) && (tp.getModuloUsuarios().equals("S"))) ? "checked" : "" %>>
            <label for="modulo_usuarios">Módulo Usuários</label> <br/> <br/>
            
            <input type="submit" name="Salvar" value="Salvar">

        </form>
    </body>
</html>
