<%-- 
    Document   : categorias
    Created on : 4 de out. de 2025, 16:21:41
    Author     : maria
--%>
<%@page import="model.Categorias"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <title>EventPass - Categorias</title>
    </head>
    <body class="bg-light">
        <%@ include file="/home/app/modulos.jsp" %>
        
        <% ArrayList<Categorias> dados = new Categorias().getAllTableEntities(); %>
        
        <div class="container mt-4">
            <!-- Cabeçalho da página -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="h3 mb-0">
                        <i class="bi bi-tags text-success me-2"></i>
                        Gerenciar Categorias
                    </h1>
                    <p class="text-muted mb-0">Classifique e organize seus eventos por categorias</p>
                </div>
                <a href="<%= request.getContextPath() %>/home/app/ger/categorias_form.jsp?action=create" 
                   class="btn btn-primary text-white">
                    <i class="bi bi-plus-circle me-1"></i>Nova Categoria
                </a>
            </div>
            
            <!-- Card da tabela -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-bottom py-3">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <h5 class="mb-0">
                                <i class="bi bi-list-check me-2 text-success"></i>
                                Lista de Categorias
                            </h5>
                        </div>
                        <div class="col-md-6 text-md-end">
                            <span class="badge bg-light text-dark border">
                                <i class="bi bi-grid-3x3-gap me-1"></i>
                                <%= dados.size() %> categoria(s)
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
                                    <th class="text-center align-middle">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Categorias ex : dados) { %>
                                <tr class="border-top">
                                    <td class="text-center align-middle">
                                        <span class="badge bg-secondary rounded-pill">
                                            <%= ex.getId() %>
                                        </span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="fw-bold"><%= ex.getNome() %></div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="text-truncate" style="max-width: 300px;" 
                                             title="<%= ex.getDescricao() != null ? ex.getDescricao() : "-" %>">
                                            <%= ex.getDescricao() != null ? ex.getDescricao() : "-" %>
                                        </div>
                                    </td>
                                    <td class="text-center align-middle">
                                        <div class="btn-group" role="group">
                                            <a href="<%= request.getContextPath() %>/home/app/ger/categorias_form.jsp?action=update&id=<%= ex.getId() %>" 
                                               class="btn btn-outline-primary btn-sm"
                                               title="Editar">
                                                <i class="bi bi-pencil-square"></i>
                                            </a>
                                            <a href="<%= request.getContextPath() %>/home?action=delete&id=<%= ex.getId() %>&task=categorias" 
                                               onclick="return confirm('Excluir a Categoria <%= ex.getNome() %>?')"
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
                                Crie categorias para organizar seus eventos
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
                            <i class="bi bi-diagram-3 text-success fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Organização</h6>
                            <p class="card-text text-muted small">Classifique eventos por tipo</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3 mb-md-0">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-funnel text-primary fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Filtragem</h6>
                            <p class="card-text text-muted small">Encontre eventos facilmente</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-collection text-warning fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Agrupamento</h6>
                            <p class="card-text text-muted small">Agrupe eventos similares</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>