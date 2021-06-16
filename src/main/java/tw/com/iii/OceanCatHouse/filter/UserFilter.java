package tw.com.iii.OceanCatHouse.filter;

import javax.servlet.*;
import java.io.IOException;

public class UserFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("----進來userBack囉----");
        chain.doFilter(request, response);
    }
}
