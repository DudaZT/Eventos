<%-- 
    Document   : eventos
    Created on : 4 de out. de 2025, 16:21:41
    Author     : maria
--%>
<%@page import="model.Eventos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <title>EventPass - Eventos</title>
    </head>
    <body class="bg-light">
        <%@ include file="/home/app/modulos.jsp" %>
        
        <% ArrayList<Eventos> dados = new Eventos().getAllTableEntities(); %>
        
        <div class="container mt-4">
            <!-- Cabeçalho da página -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="h3 mb-0">
                        <i class="bi bi-calendar-event text-primary me-2"></i>
                        Gerenciar Eventos
                    </h1>
                    <p class="text-muted mb-0">Crie e organize todos os eventos do sistema</p>
                </div>
                <a href="<%= request.getContextPath() %>/home/app/ger/eventos_form.jsp?action=create" 
                   class="btn btn-primary text-white">
                    <i class="bi bi-plus-circle me-1"></i>Novo Evento
                </a>
            </div>
            
            <!-- Card da tabela -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-bottom py-3">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <h5 class="mb-0">
                                <i class="bi bi-list-check me-2 text-primary"></i>
                                Lista de Eventos
                            </h5>
                        </div>
                        <div class="col-md-6 text-md-end">
                            <span class="badge bg-light text-dark border">
                                <i class="bi bi-calendar3 me-1"></i>
                                <%= dados.size() %> evento(s)
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
                                    <th class="align-middle">Local</th>
                                    <th class="text-center align-middle">Data</th>
                                    <th class="text-center align-middle">Preço</th>
                                    <th class="text-center align-middle">Capacidade</th>
                                    <th class="text-center align-middle">Categoria ID</th>
                                    <th class="text-center align-middle">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Eventos ex : dados) { %>
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
                                        <% if(ex.getDescricao() != null && !ex.getDescricao().isEmpty()) { %>
                                        <div class="text-muted small" style="max-width: 250px; min-width: 200px;">
                                            <%= ex.getDescricao() %>
                                        </div>
                                        <% } else { %>
                                        <span class="text-muted fst-italic small">-</span>
                                        <% } %>
                                    </td>
                                    <td class="align-middle">
                                        <div>
                                            <%= ex.getLocal() %>
                                        </div>
                                    </td>
                                    <td class="text-center align-middle">
                                        <i class="bi bi-calendar me-1"></i>
                                        <%= ex.getDataEvento() %>
                                    </td>
                                    <td class="text-center align-middle">
                                        
                                        R$ <%= ex.getPreco() %>
                                    </td>
                                    <td class="text-center align-middle">
                                        
                                        <%= ex.getCapacidadeMaxima() %> vagas
                                        
                                    </td>
                                    <td class="text-center align-middle">
                                        <span class="badge bg-dark bg-opacity-10 text-dark border border-dark border-opacity-25">
                                            <%= ex.getCategoriasId() %>
                                        </span>
                                    </td>
                                    <td class="text-center align-middle">
                                        <div class="btn-group" role="group">
                                            <a href="<%= request.getContextPath() %>/home/app/ger/eventos_form.jsp?action=update&id=<%= ex.getId() %>" 
                                               class="btn btn-outline-primary btn-sm"
                                               title="Editar">
                                                <i class="bi bi-pencil-square"></i>
                                            </a>
                                            <a href="<%= request.getContextPath() %>/home?action=delete&id=<%= ex.getId() %>&task=eventos" 
                                               onclick="return confirm('Excluir o Evento <%= ex.getNome() %>?')"
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
                                Clique em "Novo Evento" para adicionar um novo evento ao sistema
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Cards informativos -->
            <div class="row mt-4">
                <div class="col-md-3 mb-3 mb-md-0">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-card-text text-secondary fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Descrições</h6>
                            <p class="card-text text-muted small">Detalhes completos dos eventos</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3 mb-md-0">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-calendar-check text-primary fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Agendamento</h6>
                            <p class="card-text text-muted small">Gerencie datas e horários</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3 mb-md-0">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-currency-dollar text-success fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Precificação</h6>
                            <p class="card-text text-muted small">Defina valores dos ingressos</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-people text-warning fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Capacidade</h6>
                            <p class="card-text text-muted small">Controle de lotação máxima</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>