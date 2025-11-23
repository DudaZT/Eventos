
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


<h1>Menu</h1>

<menu>
  
    <li><a href="<%= request.getContextPath() %>/home/app/menu.jsp">Menu</a></li>
    
    <% if(privilegiosUsuarioLogado.getModuloUsuarios().equals("S")) {%>
        <li><a href="<%= request.getContextPath() %>/home/app/adm/privilegios.jsp">Privilégios</a></li>
        <li><a href="<%= request.getContextPath() %>/home/app/adm/usuarios.jsp">Usuários</a></li>
    <%}%>
    
    <%if( privilegiosUsuarioLogado.getModuloEventos().equals("S") ) {%>  
        <li><a href="<%= request.getContextPath() %>/home/app/ger/categorias.jsp">Categorias</a></li>
        <li><a href="<%= request.getContextPath() %>/home/app/ger/eventos.jsp">Eventos</a></li>
    
    <%}%>
    
    <%if( privilegiosUsuarioLogado.getModuloIngressos().equals("S") ) {%>  
    
        <li><a href="<%= request.getContextPath() %>/home/app/cmp/ingressos.jsp">Ingressos</a></li>
    
    <%}%>

        
    <li><a href="<%= request.getContextPath() %>/home?task=logout">Logout <%= usuarioLogado %></a></li>
</menu>

