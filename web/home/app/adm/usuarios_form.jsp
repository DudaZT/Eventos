<%-- 
    Document   : usuario_form
    Created on : 4 de out. de 2025, 16:25:48
    Author     : maria
--%>
<%@page import="model.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <title>Formulário Usuário</title>
    </head>
    <body class="container-fluid">
        <%@ include file="/home/app/modulos.jsp" %>
        <%
            Usuarios u = null;
            String action = request.getParameter("action");
            
            if (action == null)
            {
                action = "create";
            }
            
            if (action.equals("update")) {
                int id = Integer.valueOf(request.getParameter("id"));
                u = new Usuarios();
                u.setId(id);
                u.load();
            }
        %>
        
        <h1 class="mt-5">Formulário Usuários</h1>
        
        <form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=usuarios" method="post">
            <label for="id">ID:</label>
            <input type="text" name="id" id="id" pattern="\d+" title="Apenas Dígitos" value="<%= (u != null) ? u.getId() : "" %>" <%= (u != null) ? "readonly" : "" %> required><br><br>

            <label for="nome">Nome:</label>
            <input type="text" id="nome" name ="nome" value="<%= ((u != null) && (u.getNome() != null)) ? u.getNome() : ""%>" required><br/><br/>
            
            <label for="email">E-mail:</label>
            <input type="email" name="email" id="email" value="<%= ((u != null) && (u.getEmail() != null)) ? u.getEmail(): "" %>" required><br><br>
         
            <label for="senha">Senha:</label>
            <input type="password" name="senha" id="senha" value="<%= (u != null) ? u.getSenha() : "" %>" required><br><br>
            
            <label for="privilegios_id">Privilégios ID:</label>
            <input type="number" name="privilegios_id" id="privilegios_id" value="<%= (u != null) ? u.getPrivilegiosId(): "" %>" required><br><br>
            
            <input type="submit" value="Salvar">
        </form>
    </body>
</html>
