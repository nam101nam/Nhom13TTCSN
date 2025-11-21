/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import model.User;
import dao.Userdao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
   private final Userdao userDAO = new Userdao();

   // overide
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html,charset=UTF-8");

      String email = request.getParameter("email");
      String password = request.getParameter("password");
      User loggedInUser = userDAO.loginUser(email, password);
      if (loggedInUser != null) {

         HttpSession session = request.getSession();
         session.setAttribute("currentUser", loggedInUser);
         // If user is admin (roleId == 1) redirect to admin dashboard
         int role = loggedInUser.getRoleId();
         if (role == 1) {
            response.sendRedirect("admin/dashboard.html");
         } else {
            response.sendRedirect("index.jsp");
         }
      } else {
         request.setAttribute("errorMessage", "Email hoặc mật khẩu không đúng, vui lòng thử lại");
         request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
      }
   }
}
