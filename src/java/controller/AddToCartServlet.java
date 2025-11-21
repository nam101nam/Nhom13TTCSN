package controller; // Hoặc package servlet của bạn

import model.Cart;
import model.CartItem;
// Import Jakarta
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        request.setCharacterEncoding("UTF-8"); 
        
        
        String idStr = request.getParameter("productID");
        String qtyStr = request.getParameter("quantity");
        String priceStr = request.getParameter("price"); // Giá gốc từ JSP
        String titleStr = request.getParameter("product_title");

        try {
            
            if (priceStr == null || idStr == null || qtyStr == null || titleStr == null) {
                 throw new IllegalArgumentException("Thiếu tham số bắt buộc. Vui lòng kiểm tra tên tham số trong form.");
            }
            
            String cleanedPriceStr = priceStr.replaceAll("[^\\d.]", ""); 
            
            
            int productId = Integer.parseInt(idStr);
            int quantity = Integer.parseInt(qtyStr);
            
            double price = Double.parseDouble(cleanedPriceStr); 

            model.CartItem newItem = new model.CartItem(productId, titleStr, price, quantity); 
            
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            cart.addItem(newItem);
            response.sendRedirect("cart.jsp");
            
        } catch (NumberFormatException e) {

            response.sendError(HttpServletResponse.SC_BAD_REQUEST, 
                "LỖI ÉP KIỂU SỐ: Vui lòng kiểm tra giá trị: " + priceStr);
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }
}