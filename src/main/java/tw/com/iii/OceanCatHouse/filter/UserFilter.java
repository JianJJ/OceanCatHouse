package tw.com.iii.OceanCatHouse.filter;

import tw.com.iii.OceanCatHouse.model.UserBean;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding("utf-8");
        servletResponse.setCharacterEncoding("utf-8");
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        UserBean user = (UserBean) request.getSession().getAttribute("user");
        if(user == null){
            response.sendRedirect(request.getContextPath()+"/views/login");
        }else {
            chain.doFilter(servletRequest, servletResponse);
        }
    }
}
