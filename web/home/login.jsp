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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <title>Login</title>
    </head>
    <body class = "container-fluid">
        <%
            String msg = (String) request.getAttribute("msg");
            
            if(msg != null) 
            { %>
                <script>
                    alert("<%= msg %>");
                </script>
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
         
        <h1>Login</h1>

        <form action="<%= request.getContextPath() %>/home?task=login" method="post">

            <label for="id">ID:</label>
            <input type="type" name="id" id="id" value="<%= id != -1 ? id : "" %>" pattern="\d+" title="Apenas Dígitos" required> <br><br>

            <label for="senha">Senha:</label>
            <input type="password" name="senha" id="senha" required> <br><br>

            <input type="submit" value="Login"> <br><br>
        </form>
         
    </body>
</html>
