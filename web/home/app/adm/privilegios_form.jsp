<%-- 
    Document   : tipousuario_form
    Created on : 2 de out. de 2025, 08:48:16
    Author     : aluno
--%>

<%@page import="model.Privilegios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <title>EventPass - Formulário de Privilégios</title>
    </head>
    <body class="bg-light">
        <%@ include file="/home/app/modulos.jsp" %>
        
        <% 
            Privilegios tp = null;
            
            String action = request.getParameter("action");
            
            if(action == null)
            {
                action = "create";
            }
            else
            {
                if(action.equals("update"))
                {
                    int id = Integer.valueOf(request.getParameter("id"));
                    
                    tp = new Privilegios();
                    tp.setId(id);
                    tp.load();
                }
            }
            
            String pageTitle = action.equals("create") ? "Novo Privilégio" : "Editar Privilégio";
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
                                <a href="<%= request.getContextPath() %>/home/app/adm/privilegios.jsp" class="text-decoration-none">
                                    Privilégios
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
                                    <div class="bg-primary bg-opacity-10 p-3 rounded">
                                        <i class="bi bi-shield-check text-primary fs-3"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="mb-0"><%= pageTitle %></h5>
                                    <p class="text-muted mb-0">Preencha os dados do nível de acesso</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card-body">
                            <form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=privilegios" method="post">
                                
                                <div class="bg-light rounded-3 p-4 mb-4">
                                    <h6 class="mb-3 fw-bold">
                                        <i class="bi bi-card-text me-2"></i>
                                        Informações Básicas
                                    </h6>
                                    
                                    <div class="row mb-3">
                                        <div class="col-md-3">
                                            <label for="id" class="form-label fw-semibold">ID</label>
                                            <input type="text" class="form-control" id="id" name="id" pattern="\d+" title="Apenas Dígitos" value="<%= (tp != null) ? tp.getId() : "" %>" 
                                                   <%= (tp != null) ? "readonly" : "" %> required>
                                            <div class="form-text">Apenas números</div>
                                        </div>
                                        <div class="col-md-9">
                                            <label for="nome" class="form-label fw-semibold">Nome do Privilégio</label>
                                            <input type="text" class="form-control" id="nome" name="nome" value="<%= ((tp != null) && (tp.getNome() != null)) ? tp.getNome() : ""%>" required
                                                   placeholder="Ex: Administrador, Operador, etc.">
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="descricao" class="form-label fw-semibold">Descrição</label>
                                        <textarea class="form-control" id="descricao" name="descricao" rows="3" placeholder="Descreva as permissões deste nível de acesso"><%= ((tp != null) && (tp.getDescricao() != null)) ? tp.getDescricao() : ""%></textarea>
                                    </div>
                                </div>
                                
                                <div class="bg-light rounded-3 p-4 mb-4">
                                    <h6 class="mb-3 fw-bold">
                                        <i class="bi bi-lock me-2"></i>
                                        Módulos de Acesso
                                    </h6>
                                    <p class="text-muted mb-4">Marque os módulos que este nível de acesso pode acessar</p>
                                    
                                    <div class="row">
                                        <!-- Eventos e Categorias -->
                                        <div class="col-md-4 mb-3">
                                            <div class="card h-100 <%= ((tp != null) && (tp.getModuloEventos().equals("S"))) ? "border-success border-2" : "border" %>">
                                                <div class="card-body text-center d-flex flex-column">
                                                    <div class="form-check form-switch d-flex justify-content-center mb-3">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="modulo_eventos" name="modulo_eventos" value="S" 
                                                               <%= ((tp != null) && (tp.getModuloEventos().equals("S"))) ? "checked" : "" %>>
                                                    </div>
                                                    <i class="bi bi-calendar-event text-success fs-1 mb-2"></i>
                                                    <h6 class="card-title fw-bold">Eventos e Categorias</h6>
                                                    <p class="card-text text-muted small">Gerencia eventos e categorias</p>
                                                    <label for="modulo_eventos" class="btn btn-sm btn-outline-success mt-auto">
                                                        Habilitar/Desabilitar
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- Ingressos -->
                                        <div class="col-md-4 mb-3">
                                            <div class="card h-100 <%= ((tp != null) && (tp.getModuloIngressos().equals("S"))) ? "border-warning border-2" : "border" %>">
                                                <div class="card-body text-center d-flex flex-column">
                                                    <div class="form-check form-switch d-flex justify-content-center mb-3">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="modulo_ingressos" name="modulo_ingressos" value="S" 
                                                               <%= ((tp != null) && (tp.getModuloIngressos().equals("S"))) ? "checked" : "" %>>
                                                    </div>
                                                    <i class="bi bi-ticket-detailed text-warning fs-1 mb-2"></i>
                                                    <h6 class="card-title fw-bold">Ingressos</h6>
                                                    <p class="card-text text-muted small">Vende e controla ingressos</p>
                                                    <label for="modulo_ingressos" class="btn btn-sm btn-outline-warning mt-auto">
                                                        Habilitar/Desabilitar
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- Usuários -->
                                        <div class="col-md-4 mb-3">
                                            <div class="card h-100 <%= ((tp != null) && (tp.getModuloUsuarios().equals("S"))) ? "border-primary border-2" : "border" %>">
                                                <div class="card-body text-center d-flex flex-column">
                                                    <div class="form-check form-switch d-flex justify-content-center mb-3">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="modulo_usuarios" name="modulo_usuarios" value="S" 
                                                            <%= ((tp != null) && (tp.getModuloUsuarios().equals("S"))) ? "checked" : "" %>>
                                                    </div>
                                                    <i class="bi bi-people text-primary fs-1 mb-2"></i>
                                                    <h6 class="card-title fw-bold">Usuários</h6>
                                                    <p class="card-text text-muted small">Gerencia usuários e privilégios</p>
                                                    <label for="modulo_usuarios" class="btn btn-sm btn-outline-primary mt-auto">
                                                        Habilitar/Desabilitar
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Botões de ação -->
                                <div class="d-flex justify-content-between mt-4">
                                    <a href="<%= request.getContextPath() %>/home/app/adm/privilegios.jsp" 
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
                                    <i class="bi bi-info-circle me-1"></i>
                                    Os módulos habilitados definirão as permissões deste nível de acesso
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>