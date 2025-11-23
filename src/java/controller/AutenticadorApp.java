package controller;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AutenticadorApp implements Filter {

    public AutenticadorApp() {
    }
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        
        HttpSession sessao = httpServletRequest.getSession(false);
        
        if((sessao == null) || (sessao.getAttribute("usuarios") == null) || (sessao.getAttribute("privilegios") == null))
        {
            httpServletRequest.setAttribute("msg", "Faça o Login!");
            httpServletRequest.getRequestDispatcher("/home/login.jsp").forward(request, response);
        }
        else
        {
            // Continua a chamada se o usuário estiver logado.
            chain.doFilter(request, response);
        }
       
    }

    
}
