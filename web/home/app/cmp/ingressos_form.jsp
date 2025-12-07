<%-- 
    Document   : ingressos_form
    Created on : 4 de out. de 2025, 16:25:48
    Author     : maria
--%>
<%@page import="model.Ingressos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <title>EventPass - Formulário de Ingressos</title>
    </head>
    <body class="bg-light">
        <%@ include file="/home/app/modulos.jsp" %>
        
        <%
            Ingressos cv = null;
            String action = request.getParameter("action");
            
            if (action == null) {
                action = "create";
            }
            
            if (action.equals("update")) {
                int id = Integer.valueOf(request.getParameter("id"));
                cv = new Ingressos();
                cv.setId(id);
                cv.load();
            }
            
            String pageTitle = action.equals("create") ? "Nova Venda de Ingresso" : "Editar Venda de Ingresso";
            String buttonText = action.equals("create") ? "Registrar Venda" : "Atualizar Venda";
        %>
        
        <div class="container mt-4">
            <!-- Cabeçalho -->
            <div class="row mb-4">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb bg-white px-3 py-2 rounded shadow-sm">
                            <li class="breadcrumb-item">
                                <a href="<%= request.getContextPath() %>/home/app/menu.jsp" class="text-decoration-none">
                                    <i class="bi bi-house-door"></i> Menu
                                </a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="<%= request.getContextPath() %>/home/app/cmp/ingressos.jsp" class="text-decoration-none">
                                    Ingressos
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page"><%= pageTitle %></li>
                        </ol>
                    </nav>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-white py-3">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-warning bg-opacity-10 p-3 rounded">
                                        <i class="bi bi-ticket-detailed text-warning fs-3"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="mb-0"><%= pageTitle %></h5>
                                    <p class="text-muted mb-0">Registre uma nova venda de ingressos</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card-body">
                            <form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=ingressos" method="post">
                                
                                <div class="bg-light rounded-3 p-4 mb-4">
                                    <h6 class="mb-3 fw-bold">
                                        <i class="bi bi-card-text me-2"></i>
                                        Identificação
                                    </h6>
                                    
                                    <div class="row mb-3">
                                        <div class="col-md-4">
                                            <label for="id" class="form-label fw-semibold">ID da Venda</label>
                                            <input type="text" class="form-control" name="id" id="id" pattern="\d+" title="Apenas Dígitos" 
                                                value="<%= (cv != null) ? cv.getId() : "" %>" <%= (cv != null) ? "readonly" : "" %> 
                                                required>
                                            <div class="form-text">Código único da venda</div>
                                        </div>
                                        <div class="col-md-4">
                                            <label for="evento_id" class="form-label fw-semibold">Evento</label>
                                            <div class="input-group">
                                                <span class="input-group-text">
                                                    <i class="bi bi-calendar-event"></i>
                                                </span>
                                                <input type="number" class="form-control" name="evento_id" id="evento_id" 
                                                    value="<%= (cv != null) ? cv.getEventoId(): "" %>" required placeholder="ID do evento"
                                                    min="1">
                                            </div>
                                            
                                        </div>
                                        <div class="col-md-4">
                                            <label for="usuarios_id" class="form-label fw-semibold">Cliente</label>
                                            <div class="input-group">
                                                <span class="input-group-text">
                                                    <i class="bi bi-person"></i>
                                                </span>
                                                <input type="number" class="form-control" name="usuarios_id" id="usuarios_id" 
                                                    value="<%= (cv != null) ? cv.getUsuariosId(): "" %>" 
                                                    required placeholder="ID do usuário" min="1">
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="bg-light rounded-3 p-4 mb-4">
                                    <h6 class="mb-3 fw-bold">
                                        <i class="bi bi-cart-check me-2"></i>
                                        Detalhes da Venda
                                    </h6>
                                    
                                    <div class="row">
                                        <div class="col-md-4 mb-3">
                                            <label for="quantidade" class="form-label fw-semibold">Quantidade</label>
                                            <div class="input-group">
                                                <span class="input-group-text">
                                                    <i class="bi bi-hash"></i>
                                                </span>
                                                <input type="number" class="form-control" name="quantidade" id="quantidade" pattern="\d+" 
                                                    title="Apenas Dígitos" value="<%= (cv != null) ? cv.getQuantidade(): "" %>" 
                                                    required placeholder="Quantidade" min="1">
                                            </div>
                                            <div class="form-text">Número de ingressos</div>
                                        </div>
                                        
                                        <div class="col-md-4 mb-3">
                                            <label for="data_compra" class="form-label fw-semibold">Data da Compra</label>
                                            <div class="input-group">
                                                <span class="input-group-text">
                                                    <i class="bi bi-calendar"></i>
                                                </span>
                                                <input type="date" class="form-control" id="data_compra" name="data_compra" 
                                                    value="<%= ( cv != null) ? cv.getData_compra(): "" %>" required>
                                            </div>
                                            <div class="form-text">Data da transação</div>
                                        </div>
                                        
                                        <div class="col-md-4 mb-3">
                                            <label for="valor_total" class="form-label fw-semibold">Valor Total</label>
                                            <div class="input-group">
                                                <span class="input-group-text">
                                                    R$
                                                </span>
                                                <input type="number" class="form-control" name="valor_total" id="valor_total" 
                                                    step="0.01" min="0" value="<%= (cv != null) ? cv.getValor_total(): "" %>" 
                                                    required placeholder="0,00">
                                            </div>
                                            <div class="form-text">Valor total da venda</div>
                                        </div>
                                    </div>
                                    
                                    
                                </div>
                                
                                <!-- Botões de ação -->
                                <div class="d-flex justify-content-between mt-4">
                                    <a href="<%= request.getContextPath() %>/home/app/cmp/ingressos.jsp" 
                                       class="btn btn-outline-secondary">
                                        <i class="bi bi-arrow-left me-1"></i>Cancelar
                                    </a>
                                    <button type="submit" class="btn btn-primary text-white">
                                        <i class="bi bi-credit-card me-1"></i><%= buttonText %>
                                    </button>
                                </div>
                            </form>
                        </div>
                        
                        <div class="card-footer bg-white border-top py-3">
                            <div class="text-center">
                                <span class="text-muted small">
                                    <i class="bi bi-currency-dollar me-1"></i>
                                    Todos os valores devem ser registrados corretamente para controle financeiro
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>