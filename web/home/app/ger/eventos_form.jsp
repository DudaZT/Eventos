<%-- 
    Document   : convenios_form
    Created on : 4 de out. de 2025, 16:25:48
    Author     : maria
--%>
<%@page import="model.Eventos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <title>Formulário Eventos</title>
    </head>
    <body class="container-fluid">
        <%@ include file="/home/app/modulos.jsp" %>
        <%
            Eventos ex = null;
            String action = request.getParameter("action");
            
            if (action == null)
            {
                action = "create";
            }
            
            if (action.equals("update")) {
                int id = Integer.valueOf(request.getParameter("id"));
                ex = new Eventos();
                ex.setId(id);
                ex.load();
            }
        %>
        
        <h1 class="mt-5">Formulário Eventos</h1>
        
        <form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=eventos" method="post">
            <label for="id">ID:</label>
            <input type="text" name="id" id="id" pattern="\d+" title="Apenas Dígitos" value="<%= (ex != null) ? ex.getId() : "" %>" <%= (ex != null) ? "readonly" : "" %> required><br><br>

            <label for="nome">Nome:</label>
            <input type="text" name="nome" id="nome" value="<%= ((ex != null) && (ex.getNome() != null)) ? ex.getNome() : ""%>" required><br><br>
            
            <label for="local">Local:</label>
            <input type="text" name="local" id="local" value="<%= ((ex != null) && (ex.getLocal()!= null)) ? ex.getLocal() : ""%>" required><br><br>
            
            <label for="data_evento">Data do Evento:</label>
            <input type="date" id="data_evento" name ="data_evento" value="<%= ( (ex != null) && ( ex.getDataEvento()!= null)) ? ex.getDataEvento() : ""%>" required ><br/><br/>
            
            <label for="preco">Preço:</label>
            <input type="number" step="any" name="preco" id="preco" title="Apenas Dígitos" value="<%= (ex != null) ? ex.getPreco(): "" %>" required><br><br>
            
            <label for="capacidade_maxima">Capacidade Máxima:</label>
            <input type="number" name="capacidade_maxima" id="capacidade_maxima" pattern="\d+" title="Apenas Dígitos" value="<%= (ex != null) ? ex.getCapacidadeMaxima(): "" %>" required><br><br>
            
            <label for="descricao">Descrição:</label>
            <textarea id="descricao" name="descricao" rows="4" cols="50"><%= ((ex != null) && (ex.getDescricao() != null)) ? ex.getDescricao() : ""%></textarea><br/>
            
            <label for="categorias_id">Categoria ID:</label>
            <input type="number" name="categorias_id" id="categorias_id" value="<%= (ex != null) ? ex.getCategoriasId(): "" %>" required><br><br>

            <input type="submit" value="Salvar">
        </form>
    </body>
</html>