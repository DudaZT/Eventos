<%-- 
    Document   : categorias_form
    Created on : 4 de out. de 2025, 16:25:48
    Author     : maria
--%>
<%@page import="model.Categorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <title>EventPass - Formulário de Categorias</title>
    </head>
    <body class="bg-light">
        <%@ include file="/home/app/modulos.jsp" %>
        
        <%
            Categorias ex = null;
            String action = request.getParameter("action");
            
            if (action == null) {
                action = "create";
            }
            
            if (action.equals("update")) {
                int id = Integer.valueOf(request.getParameter("id"));
                ex = new Categorias();
                ex.setId(id);
                ex.load();
            }
            
            String pageTitle = action.equals("create") ? "Nova Categoria" : "Editar Categoria";
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
                                <a href="<%= request.getContextPath() %>/home/app/ger/categorias.jsp" class="text-decoration-none">
                                    Categorias
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
                                    <div class="bg-success bg-opacity-10 p-3 rounded">
                                        <i class="bi bi-tags text-success fs-3"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="mb-0"><%= pageTitle %></h5>
                                    <p class="text-muted mb-0">Preencha os dados da categoria</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card-body">
                            <form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=categorias" method="post">
                                
                                <div class="bg-light rounded-3 p-4 mb-4">
                                    <h6 class="mb-3 fw-bold">
                                        <i class="bi bi-card-text me-2"></i>
                                        Dados da Categoria
                                    </h6>
                                    
                                    <div class="row mb-3">
                                        <div class="col-md-3">
                                            <label for="id" class="form-label fw-semibold">ID</label>
                                            <input type="text" class="form-control" name="id" id="id" pattern="\d+" 
                                                title="Apenas Dígitos" value="<%= (ex != null) ? ex.getId() : "" %>" 
                                                <%= (ex != null) ? "readonly" : "" %> required>
                                            <div class="form-text">Apenas números</div>
                                        </div>
                                        <div class="col-md-9">
                                            <label for="nome" class="form-label fw-semibold">Nome da Categoria</label>
                                            <input type="text" class="form-control" name="nome" id="nome" 
                                                value="<%= ((ex != null) && (ex.getNome() != null)) ? ex.getNome() : ""%>" required
                                                placeholder="Ex: Música, Esportes, Teatro, etc.">
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="descricao" class="form-label fw-semibold">Descrição</label>
                                        <textarea class="form-control" id="descricao" name="descricao" 
                                            rows="4" placeholder="Descreva esta categoria de eventos"><%= ((ex != null) && (ex.getDescricao() != null)) ? ex.getDescricao() : ""%></textarea>
                                        
                                    </div>
                                </div>
                                
                                <!-- Botões de ação -->
                                <div class="d-flex justify-content-between mt-4">
                                    <a href="<%= request.getContextPath() %>/home/app/ger/categorias.jsp" 
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
                                    Categorias ajudam a organizar e filtrar eventos no sistema
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>