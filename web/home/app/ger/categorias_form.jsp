<%-- 
    Document   : convenios_form
    Created on : 4 de out. de 2025, 16:25:48
    Author     : maria
--%>
<%@page import="model.Categorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <title>Formulário Categorias</title>
    </head>
    <body class="container-fluid">
        <%@ include file="/home/app/modulos.jsp" %>
        <%
            Categorias ex = null;
            String action = request.getParameter("action");
            
            if (action == null)
            {
                action = "create";
            }
            
            if (action.equals("update")) {
                int id = Integer.valueOf(request.getParameter("id"));
                ex = new Categorias();
                ex.setId(id);
                ex.load();
            }
        %>
        
        <h1 class="mt-5">Formulário Categorias</h1>
        
        <form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=categorias" method="post">
            <label for="id">ID:</label>
            <input type="text" name="id" id="id" pattern="\d+" title="Apenas Dígitos" value="<%= (ex != null) ? ex.getId() : "" %>" <%= (ex != null) ? "readonly" : "" %> required><br><br>

            <label for="nome">Nome:</label>
            <input type="text" name="nome" id="nome" value="<%= ((ex != null) && (ex.getNome() != null)) ? ex.getNome() : ""%>" required><br><br>

            <label for="descricao">Descrição:</label>
            <textarea id="descricao" name="descricao" rows="4" cols="50"><%= ((ex != null) && (ex.getDescricao() != null)) ? ex.getDescricao() : ""%></textarea><br/>

            <input type="submit" value="Salvar">
        </form>
    </body>
</html>