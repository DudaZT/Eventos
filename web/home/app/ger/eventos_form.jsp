<%-- 
    Document   : eventos_form
    Created on : 4 de out. de 2025, 16:25:48
    Author     : maria
--%>
<%@page import="model.Eventos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <title>EventPass - Formulário de Eventos</title>
    </head>
    <body class="bg-light">
        <%@ include file="/home/app/modulos.jsp" %>
        
        <%
            Eventos ex = null;
            String action = request.getParameter("action");
            
            if (action == null) {
                action = "create";
            }
            
            if (action.equals("update")) {
                int id = Integer.valueOf(request.getParameter("id"));
                ex = new Eventos();
                ex.setId(id);
                ex.load();
            }
            
            String pageTitle = action.equals("create") ? "Novo Evento" : "Editar Evento";
            String buttonText = action.equals("create") ? "Cadastrar" : "Atualizar";
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
                                <a href="<%= request.getContextPath() %>/home/app/ger/eventos.jsp" class="text-decoration-none">
                                    Eventos
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page"><%= pageTitle %></li>
                        </ol>
                    </nav>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-white py-3">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-primary bg-opacity-10 p-3 rounded">
                                        <i class="bi bi-calendar-event text-primary fs-3"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="mb-0"><%= pageTitle %></h5>
                                    <p class="text-muted mb-0">Preencha os dados do evento</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card-body">
                            <form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=eventos" method="post">
                                
                                <div class="bg-light rounded-3 p-4 mb-4">
                                    <h6 class="mb-3 fw-bold">
                                        <i class="bi bi-info-circle me-2"></i>
                                        Informações Básicas
                                    </h6>
                                    
                                    <div class="row mb-3">
                                        <div class="col-md-3">
                                            <label for="id" class="form-label fw-semibold">ID do Evento</label>
                                            <input type="text" class="form-control" name="id" id="id" pattern="\d+" title="Apenas Dígitos" 
                                                value="<%= (ex != null) ? ex.getId() : "" %>" <%= (ex != null) ? "readonly" : "" %> 
                                                required>
                                            <div class="form-text">Identificador único</div>
                                        </div>
                                        <div class="col-md-9">
                                            <label for="nome" class="form-label fw-semibold">Nome do Evento</label>
                                            <input type="text" class="form-control" name="nome" id="nome" value="<%= ((ex != null) && (ex.getNome() != null)) ? ex.getNome() : ""%>" 
                                                required placeholder="Ex: Show de Rock, Conferência de Tecnologia, etc.">
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="descricao" class="form-label fw-semibold">Descrição</label>
                                        <textarea class="form-control" id="descricao" name="descricao" rows="3"
                                            placeholder="Descreva o evento para os participantes"><%= ((ex != null) && (ex.getDescricao() != null)) ? ex.getDescricao() : ""%></textarea>
                                    </div>
                                </div>
                                
                                <div class="bg-light rounded-3 p-4 mb-4">
                                    <h6 class="mb-3 fw-bold">
                                        <i class="bi bi-geo-alt me-2"></i>
                                        Localização e Data
                                    </h6>
                                    
                                    <div class="row">
                                        <div class="col-md-8 mb-3">
                                            <label for="local" class="form-label fw-semibold">Local do Evento</label>
                                            <input type="text" class="form-control" name="local" id="local" value="<%= ((ex != null) && (ex.getLocal() != null)) ? ex.getLocal() : ""%>" 
                                                required placeholder="Ex: Arena do Grêmio, Teatro Municipal, etc.">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="data_evento" class="form-label fw-semibold">Data do Evento</label>
                                            <input type="date" class="form-control" id="data_evento" name="data_evento" 
                                                value="<%= ((ex != null) && (ex.getDataEvento() != null)) ? ex.getDataEvento() : ""%>" 
                                                required>
                                        </div>
                                    </div>
                                </div>
                            
                                <div class="bg-light rounded-3 p-4 mb-4">
                                    <h6 class="mb-3 fw-bold">
                                        <i class="bi bi-currency-dollar me-2"></i>
                                        Valores e Capacidade
                                    </h6>
                                    
                                    <div class="row">
                                        <div class="col-md-4 mb-3">
                                            <label for="preco" class="form-label fw-semibold">Preço do Ingresso (R$)</label>
                                            <div class="input-group">
                                                <span class="input-group-text">R$</span>
                                                <input type="number" step="0.01" class="form-control" name="preco" id="preco" 
                                                    value="<%= (ex != null) ? ex.getPreco() : "" %>" required placeholder="0.00">
                                            </div>
                                            <div class="form-text">Digite o valor do ingresso</div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="capacidade_maxima" class="form-label fw-semibold">Capacidade Máxima</label>
                                            <input type="number" class="form-control" name="capacidade_maxima" id="capacidade_maxima" 
                                                pattern="\d+" title="Apenas Dígitos" value="<%= (ex != null) ? ex.getCapacidadeMaxima() : "" %>" 
                                                required placeholder="Ex: 100">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="categorias_id" class="form-label fw-semibold">Categoria ID</label>
                                            <input type="number" class="form-control" name="categorias_id" id="categorias_id" 
                                                value="<%= (ex != null) ? ex.getCategoriasId() : "" %>" required placeholder="ID da categoria">
                                            <div class="form-text">Número da categoria associada</div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Botões de ação -->
                                <div class="d-flex justify-content-between mt-4">
                                    <a href="<%= request.getContextPath() %>/home/app/ger/eventos.jsp" 
                                       class="btn btn-outline-secondary">
                                        <i class="bi bi-arrow-left me-1"></i>Cancelar
                                    </a>
                                    <button type="submit" class="btn btn-primary text-white">
                                        <i class="bi bi-save me-1"></i><%= buttonText %>
                                    </button>
                                </div>
                            </form>
                        </div>
                        
                        <div class="card-footer bg-white border-top py-3">
                            <div class="text-center">
                                <span class="text-muted small">
                                    <i class="bi bi-lightbulb me-1"></i>
                                    Preencha todos os campos obrigatórios para cadastrar o evento
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>