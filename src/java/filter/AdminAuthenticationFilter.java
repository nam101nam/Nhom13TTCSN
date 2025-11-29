package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

public class AdminAuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        System.out.println("--- FILTER ĐANG CHẠY ---"); // Thêm dòng này
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false); // Do not create session if it doesn't exist
        
        boolean isAdmin = false;
        if (session != null) {
            User user = (User) session.getAttribute("currentUser");
            if (user != null) {
            System.out.println("Role ID hiện tại: " + user.getRoleId()); // Kiểm tra xem nó in ra số mấy?

        }
            if (user != null && user.getRoleId() == 1) { // Assuming roleId 1 is for Admin
                isAdmin = true;
            }
        }

        if (isAdmin) {
            // User is an admin, allow access to the requested page
            chain.doFilter(request, response);
        } else {
            // User is not an admin or not logged in, redirect to login page
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/dangnhap.jsp");
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}
