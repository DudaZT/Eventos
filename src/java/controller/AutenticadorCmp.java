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
import model.Privilegios;

public class AutenticadorCmp implements Filter {

    public AutenticadorCmp() {
    }
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        
        HttpSession sessao = httpServletRequest.getSession(false);
        
        Privilegios privilegios = (Privilegios) sessao.getAttribute("privilegios");
        
        if(privilegios.getModuloIngressos().equals("S") == false)
        {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/home/app/menu.jsp");
        }
        else
        {
            // Continua a chamada se o usuário estiver logado.
            chain.doFilter(request, response);
        }
       
    }
}
    