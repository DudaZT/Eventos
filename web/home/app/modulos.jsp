<%@page import="model.Privilegios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    String usuarioLogado = (String) session.getAttribute("usuarios");
    Privilegios privilegiosUsuarioLogado = (Privilegios) session.getAttribute("privilegios");
    
    if( (usuarioLogado == null) || (privilegiosUsuarioLogado == null) )
    {
        response.sendRedirect(request.getContextPath() + "/home/login.jsp");
    }
%>

<div class="container-fluid">
    <!-- Header/Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark mb-4" style="background: linear-gradient(135deg, #6f42c1 0%, #fd7e14 100%);">
        <div class="container">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/home/app/menu.jsp">
                <i class="bi bi-ticket-perforated me-2"></i>
                <strong>EventPass</strong>
            </a>
            
            <!-- Botão simples de logout -->
            <div class="d-flex align-items-center">
                <span class="text-white me-3">
                    <i class="bi bi-person-circle me-1"></i>
                    <strong><%= usuarioLogado %></strong>
                </span>
                <a href="<%= request.getContextPath() %>/home?task=logout" 
                   class="btn btn-danger btn-sm">
                    <i class="bi bi-box-arrow-right me-1"></i>Sair
                </a>
            </div>
        </div>
    </nav>

    <div class="container">
        <!-- Welcome Card -->
        <div class="card mb-4 border-0 shadow-sm">
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h1 class="h3 mb-2">Bem-vindo, <%= usuarioLogado %>!</h1>
                        <p class="text-muted mb-0">Gerencie os Usuários, Eventos, Categorias e Ingressos</p>
                    </div>
                    <div class="col-md-4 text-md-end">
                        <span class="badge bg-primary fs-6 p-2">
                            <i class="bi bi-speedometer2 me-2"></i>Painel de Controle
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Dashboard Cards -->
        <div class="row">
            <!-- Menu Principal -->
            <div class="col-lg-3 mb-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-header bg-white border-bottom">
                        <h5 class="mb-0">
                            <i class="bi bi-house-door text-primary me-2"></i>
                            Menu Principal
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="list-group list-group-flush">
                            <a href="<%= request.getContextPath() %>/home/app/menu.jsp" 
                               class="list-group-item list-group-item-action d-flex align-items-center">
                                <i class="bi bi-house me-3 text-primary"></i>
                                <div>
                                    <strong>Dashboard</strong>
                                    <p class="small text-muted mb-0">Página inicial do sistema</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Módulo de Administração -->
            <% if(privilegiosUsuarioLogado.getModuloUsuarios().equals("S")) { %>
            <div class="col-lg-3 mb-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-header bg-white border-bottom">
                        <h5 class="mb-0">
                            <i class="bi bi-shield-check text-danger me-2"></i>
                            Administração
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="list-group list-group-flush">
                            <a href="<%= request.getContextPath() %>/home/app/adm/privilegios.jsp" 
                               class="list-group-item list-group-item-action d-flex align-items-center">
                                <i class="bi bi-key me-3 text-danger"></i>
                                <div>
                                    <strong>Privilégios</strong>
                                    <p class="small text-muted mb-0">Gerencie permissões de acesso</p>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath() %>/home/app/adm/usuarios.jsp" 
                               class="list-group-item list-group-item-action d-flex align-items-center">
                                <i class="bi bi-people me-3 text-danger"></i>
                                <div>
                                    <strong>Usuários</strong>
                                    <p class="small text-muted mb-0">Gerencie usuários do sistema</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>

            <!-- Módulo de Eventos -->
            <% if(privilegiosUsuarioLogado.getModuloEventos().equals("S")) { %>
            <div class="col-lg-3 mb-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-header bg-white border-bottom">
                        <h5 class="mb-0">
                            <i class="bi bi-calendar-event text-success me-2"></i>
                            Gestão de Eventos
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="list-group list-group-flush">
                            <a href="<%= request.getContextPath() %>/home/app/ger/categorias.jsp" 
                               class="list-group-item list-group-item-action d-flex align-items-center">
                                <i class="bi bi-tags me-3 text-success"></i>
                                <div>
                                    <strong>Categorias</strong>
                                    <p class="small text-muted mb-0">Classifique seus eventos</p>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath() %>/home/app/ger/eventos.jsp" 
                               class="list-group-item list-group-item-action d-flex align-items-center">
                                <i class="bi bi-calendar-plus me-3 text-success"></i>
                                <div>
                                    <strong>Eventos</strong>
                                    <p class="small text-muted mb-0">Crie e gerencie eventos</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>

            <!-- Módulo de Ingressos -->
            <% if(privilegiosUsuarioLogado.getModuloIngressos().equals("S")) { %>
            <div class="col-lg-3 mb-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-header bg-white border-bottom">
                        <h5 class="mb-0">
                            <i class="bi bi-ticket-detailed text-warning me-2"></i>
                            Venda de Ingressos
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="list-group list-group-flush">
                            <a href="<%= request.getContextPath() %>/home/app/cmp/ingressos.jsp" 
                               class="list-group-item list-group-item-action d-flex align-items-center">
                                <i class="bi bi-ticket me-3 text-warning"></i>
                                <div>
                                    <strong>Ingressos</strong>
                                    <p class="small text-muted mb-0">Venda e controle de ingressos</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

        <div class="row mt-4">
            <div class="col-12">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <div class="row text-center">
                            <div class="col-md-4 mb-3 mb-md-0">
                                <div class="p-3 rounded bg-light">
                                    <i class="bi bi-person-check fs-3 text-primary"></i>
                                    <h4 class="mt-2 mb-0">Usuário</h4>
                                    <p class="text-muted mb-0"><%= usuarioLogado %></p>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3 mb-md-0">
                                <div class="p-3 rounded bg-light">
                                    <i class="bi bi-calendar3 fs-3 text-success"></i>
                                    <h4 class="mt-2 mb-0">Eventos e Categorias</h4>
                                    <p class="text-muted mb-0">
                                        <%= privilegiosUsuarioLogado.getModuloEventos().equals("S") ? "Acesso Liberado" : "Acesso Restrito" %>
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="p-3 rounded bg-light">
                                    <i class="bi bi-ticket fs-3 text-warning"></i>
                                    <h4 class="mt-2 mb-0">Ingressos</h4>
                                    <p class="text-muted mb-0">
                                        <%= privilegiosUsuarioLogado.getModuloIngressos().equals("S") ? "Acesso Liberado" : "Acesso Restrito" %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>