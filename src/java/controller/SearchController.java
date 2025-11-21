package controller;

import dao.Productdao;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList; 
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/search") 
public class SearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final Productdao productDAO = new Productdao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String keyword = request.getParameter("query");
        List<Product> searchResults = null;

        if (keyword != null && !keyword.trim().isEmpty()) {
            try {
                
                searchResults = productDAO.searchProducts(keyword.trim());
                
                
                if (searchResults != null) {
                    for (Product p : searchResults) {
                        List<String> images = productDAO.getProductImagesById(p.getId());
                        
                        
                        p.setImages(images); 
                    }
                }
                
            } catch (SQLException ex) {
                Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("errorMessage", "Lỗi truy vấn cơ sở dữ liệu khi tìm kiếm.");
            }
        }
        
        request.setAttribute("products", searchResults);
        request.setAttribute("keyword", keyword);
        
        request.getRequestDispatcher("SearchResults.jsp").forward(request, response);
    }
}