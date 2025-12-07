<%-- 
    Document   : login
    Created on : 9 de out. de 2025, 10:41:31
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxMxD2scQbITxI" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <title>EventPass - Login</title>
    </head>
    <body class="bg-light">
        <%
            String msg = (String) request.getAttribute("msg");
            
            if(msg != null) 
            { 
        %>
        <!-- Modal  -->
        <div class="modal fade show d-block" tabindex="-1" style="background-color: rgba(0,0,0,0.5);">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>
                            EventPass
                        </h5>
                        <a href="<%= request.getContextPath() %>/home/login.jsp" class="btn-close"></a>
                    </div>
                    <div class="modal-body">
                        <p><%= msg %></p>
                    </div>
                    <div class="modal-footer">
                        <a href="<%= request.getContextPath() %>/home/login.jsp" class="btn btn-warning">
                            OK
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
        
        <% 
           HttpSession sessao = request.getSession(false);

           if ((sessao != null) && (sessao.getAttribute("usuarios") != null) && (sessao.getAttribute("privilegios") != null))
           {
               response.sendRedirect(request.getContextPath() + "/home/app/menu.jsp");
           }
        %>
         
        <% 
            int id = -1;
            
            Cookie[] cookies = request.getCookies();
            
            if(cookies != null)
            {
               for (Cookie c : cookies)
                {
                    if(c.getName().equals("id"))
                    {
                        id = Integer.parseInt(c.getValue());
                    }
                } 
            }
        %>
        
        <div class="container">
            <div class="row justify-content-center min-vh-100 align-items-center">
                <div class="col-md-6 col-lg-5">
                    <div class="card shadow-lg border-0">
                        <div class="card-header text-white" style="background: linear-gradient(135deg, #6f42c1 0%, #fd7e14 100%);">
                            <div class="text-center py-4">
                                <i class="bi bi-ticket-perforated display-4"></i>
                                <h1 class="h3 mb-0">EventPass</h1>
                                <p class="mb-0 opacity-75">Sistema de Gestão de Eventos</p>
                            </div>
                        </div>
                        
                        <div class="card-body p-5">
                            <h2 class="h4 mb-4 text-center">Acessar Sistema</h2>
                            
                            <form action="<%= request.getContextPath() %>/home?task=login" method="post">
                                <div class="mb-3">
                                    <label for="id" class="form-label">
                                        <i class="bi bi-person-badge me-2"></i>ID do Usuário
                                    </label>
                                    <input type="text" class="form-control form-control-lg" name="id" id="id" value="<%= id != -1 ? id : "" %>" 
                                           pattern="\d+" title="Apenas Dígitos" required placeholder="Digite seu ID">
                                    <div class="form-text">Digite apenas números</div>
                                </div>
                                
                                <div class="mb-4">
                                    <label for="senha" class="form-label">
                                        <i class="bi bi-key me-2"></i>Senha
                                    </label>
                                    <input type="password" class="form-control form-control-lg" name="senha" id="senha" required placeholder="Digite sua senha">
                                </div>
                                
                                <div class="d-grid mb-3">
                                    <button type="submit" class="btn btn-lg text-white" style="background-color: #6f42c1;">
                                        <i class="bi bi-box-arrow-in-right me-2"></i>Entrar
                                    </button>
                                </div>
                            </form>
                        </div>
                        
                        <div class="card-footer bg-light text-center py-3">
                            <small class="text-muted">
                                <i class="bi bi-star-fill text-warning"></i>
                                Gerencie seus eventos, categorias, ingressos e clientes
                                <i class="bi bi-star-fill text-warning"></i>
                            </small>
                        </div>
                    </div>
                    
                    <!-- Módulos do Sistema -->
                    <div class="mt-4">
                        <h6 class="text-center mb-3 text-muted">
                            <i class="bi bi-puzzle me-1"></i>
                            Módulos do Sistema
                        </h6>
                        
                        <div class="row g-3">
                            <!-- Eventos e Categorias -->
                            <div class="col-md-4 d-flex">
                                <div class="p-3 rounded bg-white border border-success border-2 flex-fill d-flex flex-column">
                                    <div class="text-center flex-fill d-flex flex-column justify-content-center">
                                        <i class="bi bi-calendar-event text-success fs-1 mb-2"></i>
                                        <h6 class="fw-bold mb-1">Eventos e Categorias</h6>
                                        <p class="small text-muted mb-0">Crie e organize eventos</p>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Ingressos -->
                            <div class="col-md-4 d-flex">
                                <div class="p-3 rounded bg-white border border-warning border-2 flex-fill d-flex flex-column">
                                    <div class="text-center flex-fill d-flex flex-column justify-content-center">
                                        <i class="bi bi-ticket-detailed text-warning fs-1 mb-2"></i>
                                        <h6 class="fw-bold mb-1">Ingressos</h6>
                                        <p class="small text-muted mb-0">Controle de vendas</p>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Clientes/Usuários -->
                            <div class="col-md-4 d-flex">
                                <div class="p-3 rounded bg-white border border-primary border-2 flex-fill d-flex flex-column">
                                    <div class="text-center flex-fill d-flex flex-column justify-content-center">
                                        <i class="bi bi-people text-primary fs-1 mb-2"></i>
                                        <h6 class="fw-bold mb-1">Clientes/Usuários</h6>
                                        <p class="small text-muted mb-0">Gerencie acesso</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>