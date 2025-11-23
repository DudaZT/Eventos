<%-- 
    Document   : convenios_form
    Created on : 4 de out. de 2025, 16:25:48
    Author     : maria
--%>
<%@page import="model.Ingressos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <title>Formulário Convênios</title>
    </head>
    <body class="container-fluid">
        <%@ include file="/home/app/modulos.jsp" %>
        <%
            Ingressos cv = null;
            String action = request.getParameter("action");
            
            if (action == null)
            {
                action = "create";
            }
            
            if (action.equals("update")) {
                int id = Integer.valueOf(request.getParameter("id"));
                cv = new Ingressos();
                cv.setId(id);
                cv.load();
            }
        %>
        
        <h1 class="mt-5">Formulário Ingressos</h1>
        
        <form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=ingressos" method="post">
            <label for="id">ID:</label>
            <input type="text" name="id" id="id" pattern="\d+" title="Apenas Dígitos" value="<%= (cv != null) ? cv.getId() : "" %>" <%= (cv != null) ? "readonly" : "" %> required><br><br>
            
            <label for="evento_id">Evento ID:</label>
            <input type="number" name="evento_id" id="evento_id" value="<%= (cv != null) ? cv.getEventoId(): "" %>" required><br><br>
            
            <label for="usuarios_id">Usuário ID:</label>
            <input type="number" name="usuarios_id" id="usuarios_id" value="<%= (cv != null) ? cv.getUsuariosId(): "" %>" required><br><br>
            
            <label for="quantidade">Quantidade:</label>
            <input type="number" name="quantidade" id="quantidade" pattern="\d+" title="Apenas Dígitos" value="<%= (cv != null) ? cv.getQuantidade(): "" %>" required><br><br>
            
            <label for="data_compra">Data da Compra:</label>
            <input type="date" id="data_compra" name ="data_compra" value="<%= ( cv != null) ? cv.getData_compra(): "" %>" required ><br/><br/>
            
            <label for="valor_total">Valor Total:</label>
            <input type="number" name="valor_total" id="valor_total" pattern="\d+(\.\d+)?" title="Apenas Dígitos" value="<%= (cv != null) ? cv.getValor_total(): "" %>" required><br><br>

            <input type="submit" value="Salvar">
        </form>
    </body>
</html>
