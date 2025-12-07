<%-- 
    Document   : usuario
    Created on : 4 de out. de 2025, 16:21:41
    Author     : maria
--%>
<%@page import="model.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <title>EventPass - Usuários</title>
    </head>
    <body class="bg-light">
        <%@ include file="/home/app/modulos.jsp" %>
        
        <% ArrayList<Usuarios> usuarios = new Usuarios().getAllTableEntities(); %>
        
        <div class="container mt-4">
            <!-- Cabeçalho da página -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="h3 mb-0">
                        <i class="bi bi-people text-primary me-2"></i>
                        Gerenciar Usuários
                    </h1>
                    <p class="text-muted mb-0">Gerencie os usuários do sistema</p>
                </div>
                <a href="<%= request.getContextPath() %>/home/app/adm/usuarios_form.jsp?action=create" 
                   class="btn btn-primary text-white">
                    <i class="bi bi-person-plus me-1"></i>Novo Usuário
                </a>
            </div>
            
            <!-- Card da tabela -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-bottom py-3">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <h5 class="mb-0">
                                <i class="bi bi-person-lines-fill me-2 text-primary"></i>
                                Lista de Usuários
                            </h5>
                        </div>
                        <div class="col-md-6 text-md-end">
                            <span class="badge bg-light text-dark border">
                                <i class="bi bi-people-fill me-1"></i>
                                <%= usuarios.size() %> usuário(s)
                            </span>
                        </div>
                    </div>
                </div>
                
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover table-borderless mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="text-center align-middle">ID</th>
                                    <th class="align-middle">Nome</th>
                                    <th class="align-middle">E-mail</th>
                                    <th class="text-center align-middle">Privilégios ID</th>
                                    <th class="text-center align-middle">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Usuarios u : usuarios) { %>
                                <tr class="border-top">
                                    <td class="text-center align-middle">
                                        <span class="badge bg-secondary rounded-pill">
                                            <%= u.getId() %>
                                        </span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="fw-bold"><%= u.getNome() %></div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex align-items-center">
                                            <i class="bi bi-envelope text-muted me-2"></i>
                                            <div class="text-truncate" style="max-width: 200px;">
                                                <%= u.getEmail() %>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center align-middle">
                                        <span class="badge bg-dark bg-opacity-10 text-dark border border-dark border-opacity-25">
                                            <%= u.getPrivilegiosId()%>
                                        </span>
                                    </td>
                                    <td class="text-center align-middle">
                                        <div class="btn-group" role="group">
                                            <a href="<%= request.getContextPath() %>/home/app/adm/usuarios_form.jsp?action=update&id=<%= u.getId() %>" 
                                               class="btn btn-outline-primary btn-sm"
                                               title="Editar">
                                                <i class="bi bi-pencil-square"></i>
                                            </a>
                                            <a href="<%= request.getContextPath() %>/home?action=delete&id=<%= u.getId() %>&task=usuarios" 
                                               onclick="return confirm('Excluir usuário <%= u.getNome() %>?')"
                                               class="btn btn-outline-danger btn-sm"
                                               title="Excluir">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="card-footer bg-white border-top py-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <a href="<%= request.getContextPath() %>/home/app/menu.jsp" 
                               class="btn btn-outline-secondary">
                                <i class="bi bi-arrow-left me-1"></i>Voltar ao Menu
                            </a>
                        </div>
                        <div>
                            <span class="text-muted small">
                                <i class="bi bi-info-circle me-1"></i>
                                Gerencie as contas de acesso ao sistema
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Cards informativos -->
            <div class="row mt-4">
                <div class="col-md-4 mb-3 mb-md-0">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-person-check text-primary fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Controle de Acesso</h6>
                            <p class="card-text text-muted small">Gerencie quem acessa o sistema</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3 mb-md-0">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-shield-lock text-success fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Segurança</h6>
                            <p class="card-text text-muted small">Proteja os dados do sistema</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-key text-warning fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Permissões</h6>
                            <p class="card-text text-muted small">Defina níveis de acesso</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>