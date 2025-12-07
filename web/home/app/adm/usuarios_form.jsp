<%-- 
    Document   : usuario_form
    Created on : 4 de out. de 2025, 16:25:48
    Author     : maria
--%>
<%@page import="model.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <title>EventPass - Formulário de Usuários</title>
    </head>
    <body class="bg-light">
        <%@ include file="/home/app/modulos.jsp" %>
        
        <%
            Usuarios u = null;
            String action = request.getParameter("action");
            
            if (action == null) {
                action = "create";
            }
            
            if (action.equals("update")) {
                int id = Integer.valueOf(request.getParameter("id"));
                u = new Usuarios();
                u.setId(id);
                u.load();
            }
            
            String pageTitle = action.equals("create") ? "Novo Usuário" : "Editar Usuário";
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
                                <a href="<%= request.getContextPath() %>/home/app/adm/usuarios.jsp" class="text-decoration-none">
                                    Usuários
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
                                        <i class="bi bi-person-plus text-primary fs-3"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="mb-0"><%= pageTitle %></h5>
                                    <p class="text-muted mb-0">Preencha os dados do usuário</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card-body">
                            <form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=usuarios" method="post">
                                
                                <div class="bg-light rounded-3 p-4 mb-4">
                                    <h6 class="mb-3 fw-bold">
                                        <i class="bi bi-person-circle me-2"></i>
                                        Dados do Usuário
                                    </h6>
                                    
                                    <div class="row mb-3">
                                        <div class="col-md-3">
                                            <label for="id" class="form-label fw-semibold">ID</label>
                                            <input type="text" class="form-control" name="id" id="id" pattern="\d+" title="Apenas Dígitos" value="<%= (u != null) ? u.getId() : "" %>" 
                                                   <%= (u != null) ? "readonly" : "" %> required>
                                            <div class="form-text">Apenas números</div>
                                        </div>
                                        <div class="col-md-9">
                                            <label for="nome" class="form-label fw-semibold">Nome Completo</label>
                                            <input type="text" class="form-control" id="nome" name="nome" value="<%= ((u != null) && (u.getNome() != null)) ? u.getNome() : ""%>" required
                                                placeholder="Digite o nome completo">
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="email" class="form-label fw-semibold">E-mail</label>
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="bi bi-envelope"></i>
                                            </span>
                                            <input type="email" class="form-control" name="email" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                                   value="<%= ((u != null) && (u.getEmail() != null)) ? u.getEmail(): "" %>" required placeholder="exemplo@email.com">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="bg-light rounded-3 p-4 mb-4">
                                    <h6 class="mb-3 fw-bold">
                                        <i class="bi bi-shield-lock me-2"></i>
                                        Segurança e Permissões
                                    </h6>
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="senha" class="form-label fw-semibold">Senha</label>
                                            <div class="input-group">
                                                <input type="password" class="form-control" name="senha" id="senha" 
                                                       value="<%= (u != null) ? u.getSenha() : "" %>" required placeholder="Digite a senha">
                                                <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                                    <i class="bi bi-eye" id="passwordToggleIcon"></i>
                                                </button>
                                            </div>
                                            <div class="form-text">Mínimo de 6 caracteres</div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label for="privilegios_id" class="form-label fw-semibold">Nível de Acesso</label>
                                            <div class="input-group">
                                                <span class="input-group-text">
                                                    <i class="bi bi-shield-check"></i>
                                                </span>
                                                <input type="number" class="form-control" name="privilegios_id" id="privilegios_id" value="<%= (u != null) ? u.getPrivilegiosId(): "" %>" 
                                                       required placeholder="ID do privilégio" min="1">
                                            </div>
                                            <div class="form-text">
                                                <a href="<%= request.getContextPath() %>/home/app/adm/privilegios.jsp" 
                                                   class="text-decoration-none">
                                                    <i class="bi bi-link me-1"></i>Ver lista de privilégios
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="alert alert-info mt-3">
                                        <div class="d-flex">
                                            <i class="bi bi-info-circle me-2"></i>
                                            <div>
                                                <strong class="fw-bold">Importante:</strong> O ID do privilégio define as permissões do usuário no sistema.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Botões de ação -->
                                <div class="d-flex justify-content-between mt-4">
                                    <a href="<%= request.getContextPath() %>/home/app/adm/usuarios.jsp" 
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
                                    <i class="bi bi-key me-1"></i>
                                    Mantenha as senhas em segredo e atualize regularmente
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            document.getElementById('togglePassword').addEventListener('click', function() {
                const passwordInput = document.getElementById('senha');
                const toggleIcon = document.getElementById('passwordToggleIcon');
                
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    toggleIcon.classList.remove('bi-eye');
                    toggleIcon.classList.add('bi-eye-slash');
                } else {
                    passwordInput.type = 'password';
                    toggleIcon.classList.remove('bi-eye-slash');
                    toggleIcon.classList.add('bi-eye');
                }
            });
        </script>
    </body>
</html>