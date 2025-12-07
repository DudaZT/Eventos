<%-- 
    Document   : ingressos
    Created on : 4 de out. de 2025, 16:21:41
    Author     : maria
--%>
<%@page import="model.Ingressos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <title>EventPass - Ingressos</title>
    </head>
    <body class="bg-light">
        <%@ include file="/home/app/modulos.jsp" %>
        
        <% ArrayList<Ingressos> dados = new Ingressos().getAllTableEntities(); %>
        
        <div class="container mt-4">
            <!-- Cabeçalho da página -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="h3 mb-0">
                        <i class="bi bi-ticket-detailed text-warning me-2"></i>
                        Gerenciar Ingressos
                    </h1>
                    <p class="text-muted mb-0">Controle de vendas e ingressos dos eventos</p>
                </div>
                <a href="<%= request.getContextPath() %>/home/app/cmp/ingressos_form.jsp?action=create" 
                   class="btn btn-primary text-white">
                    <i class="bi bi-plus-circle me-1"></i>Nova Venda
                </a>
            </div>
            
            <!-- Card da tabela -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-bottom py-3">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <h5 class="mb-0">
                                <i class="bi bi-receipt me-2 text-warning"></i>
                                Registro de Ingressos
                            </h5>
                        </div>
                        <div class="col-md-6 text-md-end">
                            <span class="badge bg-light text-dark border">
                                <i class="bi bi-ticket-perforated me-1"></i>
                                <%= dados.size() %> venda(s)
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
                                    <th class="text-center align-middle">Evento</th>
                                    <th class="text-center align-middle">Usuário</th>
                                    <th class="text-center align-middle">Quantidade</th>
                                    <th class="text-center align-middle">Data Compra</th>
                                    <th class="text-center align-middle">Valor Total</th>
                                    <th class="text-center align-middle">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Ingressos cv : dados) { %>
                                <tr class="border-top">
                                    <td class="text-center align-middle">
                                        <span class="badge bg-secondary rounded-pill">
                                            <%= cv.getId() %>
                                        </span>
                                    </td>
                                    <td class="text-center align-middle">
                                        <span class="badge bg-dark bg-opacity-10 text-dark border border-dark border-opacity-25">
                                            <%= cv.getEventoId()%>
                                        </span>
                                    </td>
                                    <td class="text-center align-middle">
                                        <span class="badge bg-dark bg-opacity-10 text-dark border border-dark border-opacity-25">
                                            <%= cv.getUsuariosId()%>
                                        </span>
                                    </td>
                                    <td class="text-center align-middle">
                                        
                                        <%= cv.getQuantidade()%>
                                        
                                    </td>
                                    <td class="text-center align-middle">
                                        
                                        <i class="bi bi-calendar me-1"></i>
                                        <%= cv.getData_compra()%>
                                        
                                    </td>
                                    <td class="text-center align-middle">
                                        
                                        R$ <%= cv.getValor_total()%>
                                        
                                    </td>
                                    <td class="text-center align-middle">
                                        <div class="btn-group" role="group">
                                            <a href="<%= request.getContextPath() %>/home/app/cmp/ingressos_form.jsp?action=update&id=<%= cv.getId() %>" 
                                               class="btn btn-outline-primary btn-sm"
                                               title="Editar">
                                                <i class="bi bi-pencil-square"></i>
                                            </a>
                                            <a href="<%= request.getContextPath() %>/home?action=delete&id=<%= cv.getId() %>&task=ingressos" 
                                               onclick="return confirm('Excluir Ingresso #<%= cv.getId()%>?')"
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
                                Gerencie as vendas de ingressos dos eventos
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
                            <i class="bi bi-cash-coin text-success fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Vendas</h6>
                            <p class="card-text text-muted small">Controle financeiro de ingressos</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3 mb-md-0">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-graph-up text-primary fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Relatórios</h6>
                            <p class="card-text text-muted small">Análise de vendas por evento</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-clock-history text-warning fs-1 mb-3"></i>
                            <h6 class="card-title fw-bold">Histórico</h6>
                            <p class="card-text text-muted small">Registro completo de compras</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>