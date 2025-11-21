/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;
 
import dao.Userdao;
import model.User;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{
        private final Userdao userDAO= new Userdao();
//override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            
            String fullname=request.getParameter("fullname");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String password=request.getParameter("password");
            String confirmPassword=request.getParameter("confirmPassword");
            if(!password.equals(confirmPassword)){
                request.setAttribute("errorMessage","Mật khẩu và xác nhận mật khẩu không khớp");
                request.getRequestDispatcher("dangki.jsp").forward(request, response); 
                return;
            }
            User newUser = new User(fullname,email,phone,password);
            if(userDAO.registerUser(newUser)){
                response.sendRedirect("dangnhap.jsp?success=true");
            }else{
                request.setAttribute("errorMesage", "Đăng kí thất bại.email hoặc tài khoản đã tồn tại");
                request.getRequestDispatcher("dangki.jsp").forward(request,response);
            }
        }
        
}
