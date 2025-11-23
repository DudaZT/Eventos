<%-- 
    Document   : tipousuario
    Created on : 2 de out. de 2025, 08:48:03
    Author     : aluno
--%>

<%@page import="model.Privilegios"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <title>Tipo Usuário</title>
    </head>
    <body class = "container-fluid">
        <%@ include file="/home/app/modulos.jsp" %>
        <% ArrayList<Privilegios> dados = new Privilegios().getAllTableEntities(); %>
        <h1 class="mt-5">Privilégios</h1>
        <table class="table table-striped table-bordered">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Eventos</th>
                <th>Ingressos</th>
                <th>Usuários</th>
                <th>Alterar</th>
                <th>Excluir</th>
            </tr>
            
            <% for(Privilegios tp : dados) { %>
            <tr>
                <td><%= tp.getId() %></td>
                <td><%= tp.getNome() %></td>
                <td><%= tp.getDescricao()!= null ? tp.getDescricao(): "-"  %></td>
                <td><%= tp.getModuloEventos()%></td>
                <td><%= tp.getModuloIngressos()%></td>
                <td><%= tp.getModuloUsuarios()%></td>
                <td><a href="<%= request.getContextPath() %>/home/app/adm/privilegios_form.jsp?action=update&id=<%= tp.getId() %>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                    </svg>
                    </a>
                </td>
                <td><a href="<%=request.getContextPath()%>/home?action=delete&id=<%= tp.getId() %>&task=privilegios" onclick="return confirm('Deseja realmente excluir Privilégio: <%= tp.getId() %> (<%= tp.getNome() %>) ?')">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                            <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                        </svg>
                    </a>
                </td>
            </tr>
                           
            <% } %>
        </table>
        <br>
        <a href="<%= request.getContextPath() %>/home/app/adm/privilegios_form.jsp?action=create">Adicionar</a>
    </body>
</html>
