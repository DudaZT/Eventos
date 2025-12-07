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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <title>EventPass - Privilégios</title>
    </head>
    <body class="bg-light">
        <%@ include file="/home/app/modulos.jsp" %>
        
        <% ArrayList<Privilegios> dados = new Privilegios().getAllTableEntities(); %>
        
        <div class="container mt-4">
            <!-- Cabeçalho da página -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="h3 mb-0">
                        <i class="bi bi-shield-check text-danger me-2"></i>
                        Gerenciar Privilégios
                    </h1>
                    <p class="text-muted mb-0">Configure os níveis de acesso dos usuários</p>
                </div>
                <a href="<%= request.getContextPath() %>/home/app/adm/privilegios_form.jsp?action=create" 
                   class="btn text-white bg-primary">
                    <i class="bi bi-plus-circle me-1"></i>Novo Privilégio
                </a>
            </div>
            
            <!-- Card da tabela -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-bottom py-3">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <h5 class="mb-0">
                                <i class="bi bi-list-check me-2 text-primary"></i>
                                Lista de Privilégios
                            </h5>
                        </div>
                        <div class="col-md-6 text-md-end">
                            <span class="badge bg-light text-dark border">
                                <i class="bi bi-grid-3x3-gap me-1"></i>
                                <%= dados.size() %> registro(s)
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
                                    <th class="align-middle">Descrição</th>
                                    <th class="text-center align-middle">Eventos</th>
                                    <th class="text-center align-middle">Ingressos</th>
                                    <th class="text-center align-middle">Usuários</th>
                                    <th class="text-center align-middle">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Privilegios tp : dados) { %>
                                <tr class="border-top">
                                    <td class="text-center align-middle">
                                        <span class="badge bg-secondary rounded-pill">
                                            <%= tp.getId() %>
                                        </span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="fw-bold"><%= tp.getNome() %></div>
                                    </td>
                                    <td class="align-middle">
                                        <%= tp.getDescricao() != null ? tp.getDescricao() : "-" %>
                                    </td>
                                    <td class="text-center align-middle">
                                        <% if(tp.getModuloEventos().equals("S")) { %>
                                            <span class="badge bg-success rounded-pill">
                                                <i class="bi bi-check-circle"></i>
                                            </span>
                                        <% } else { %>
                                            <span class="badge bg-danger rounded-pill">
                                                <i class="bi bi-x-circle"></i>
                                            </span>
                                        <% } %>
                                    </td>
                                    <td class="text-center align-middle">
                                        <% if(tp.getModuloIngressos().equals("S")) { %>
                                            <span class="badge bg-success rounded-pill">
                                                <i class="bi bi-check-circle"></i>
                                            </span>
                                        <% } else { %>
                                            <span class="badge bg-danger rounded-pill">
                                                <i class="bi bi-x-circle"></i>
                                            </span>
                                        <% } %>
                                    </td>
                                    <td class="text-center align-middle">
                                        <% if(tp.getModuloUsuarios().equals("S")) { %>
                                            <span class="badge bg-success rounded-pill">
                                                <i class="bi bi-check-circle"></i>
                                            </span>
                                        <% } else { %>
                                            <span class="badge bg-danger rounded-pill">
                                                <i class="bi bi-x-circle"></i>
                                            </span>
                                        <% } %>
                                    </td>
                                    <td class="text-center align-middle">
                                        <div class="btn-group" role="group">
                                            <a href="<%= request.getContextPath() %>/home/app/adm/privilegios_form.jsp?action=update&id=<%= tp.getId() %>" 
                                               class="btn btn-outline-primary btn-sm"
                                               title="Editar">
                                                <i class="bi bi-pencil-square"></i>
                                            </a>
                                            <a href="<%=request.getContextPath()%>/home?action=delete&id=<%= tp.getId() %>&task=privilegios" 
                                               onclick="return confirm('Deseja realmente excluir Privilégio: <%= tp.getId() %> (<%= tp.getNome() %>) ?')"
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
                                Clique nos ícones para editar ou excluir
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
                            <i class="bi bi-calendar-event text-success fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Eventos e Categorias</h6>
                            <p class="card-text text-muted small">Permite gerenciar eventos e categorias</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3 mb-md-0">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-ticket-detailed text-warning fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Ingressos</h6>
                            <p class="card-text text-muted small">Permite vender e controlar ingressos</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-people text-primary fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Usuários</h6>
                            <p class="card-text text-muted small">Permite gerenciar usuários e privilégios</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>