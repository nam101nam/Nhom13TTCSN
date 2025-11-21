package dao;

import context.DBcontext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class Productdao {
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT id, product_title, product_price, amount_of_product, more_infor_product, cpu, ram, storage, gpu, screen, battery, audio, ports, wireless, weight, color, conditionn, warranty FROM products";
        try (Connection conn = DBcontext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("id"),
                    rs.getString("product_title"),
                    rs.getDouble("product_price"),
                    rs.getInt("amount_of_product"),
                    rs.getString("more_infor_product"),
                    rs.getString("cpu"),
                    rs.getString("ram"),
                    rs.getString("storage"),
                    rs.getString("gpu"),
                    rs.getString("screen"),
                    rs.getString("battery"),
                    rs.getString("audio"),
                    rs.getString("ports"),
                    rs.getString("wireless"),
                    rs.getString("weight"),
                    rs.getString("color"),
                    rs.getString("conditionn"),
                    rs.getString("warranty")
                );
                products.add(p);
            }
        }
        return products;
    }

    public Product getProductById(int id) throws SQLException {
        String sql = "SELECT id, product_title, product_price, amount_of_product, more_infor_product, cpu, ram, storage, gpu, screen, battery, audio, ports, wireless, weight, color, conditionn, warranty FROM products WHERE id = ?";
        try (Connection conn = DBcontext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    List<String> images;
                    try {
                        images = getProductImagesById(id); 
                    } catch (SQLException e) {
                        images = new ArrayList<>(); 
                        System.out.println("Lỗi khi lấy ảnh cho product id " + id + ": " + e.getMessage());
                    }
                    
                    Product p = new Product(
                        rs.getInt("id"),
                        rs.getString("product_title") != null ? rs.getString("product_title") : "",
                        rs.getDouble("product_price"),
                        rs.getInt("amount_of_product"),
                        rs.getString("more_infor_product") != null ? rs.getString("more_infor_product") : "",
                        rs.getString("cpu") != null ? rs.getString("cpu") : "",
                        rs.getString("ram") != null ? rs.getString("ram") : "",
                        rs.getString("storage") != null ? rs.getString("storage") : "",
                        rs.getString("gpu") != null ? rs.getString("gpu") : "",
                        rs.getString("screen") != null ? rs.getString("screen") : "",
                        rs.getString("battery") != null ? rs.getString("battery") : "",
                        rs.getString("audio") != null ? rs.getString("audio") : "",
                        rs.getString("ports") != null ? rs.getString("ports") : "",
                        rs.getString("wireless") != null ? rs.getString("wireless") : "",
                        rs.getString("weight") != null ? rs.getString("weight") : "",
                        rs.getString("color") != null ? rs.getString("color") : "",
                        rs.getString("conditionn") != null ? rs.getString("conditionn") : "",
                        rs.getString("warranty") != null ? rs.getString("warranty") : "",
                        images != null ? images : new ArrayList<>()
                    );
                    return p;
                }
            }
        }
        return null;
    }

    public List<String> getProductImagesById(int productId) throws SQLException {
        List<String> images = new ArrayList<>();
        String sql = "SELECT image_url FROM product_images WHERE product_id = ? ORDER BY is_main_image DESC";
        try (Connection conn = DBcontext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String imageUrl = rs.getString("image_url");
                    if (imageUrl != null && !imageUrl.trim().isEmpty()) {
                        images.add(imageUrl);
                    }
                }
            } catch (SQLException e) {
                System.out.println("Lỗi truy vấn ảnh cho product_id " + productId + ": " + e.getMessage());
                throw e;
            }
        }
        return images;
    }
    public List<Product> searchProducts(String keyword) throws SQLException {
        List<Product> products = new ArrayList<>();
        
        String sql = "SELECT id, product_title, product_price, amount_of_product, more_infor_product, cpu, ram, storage, gpu, screen, battery, audio, ports, wireless, weight, color, conditionn, warranty FROM products "
                   + "WHERE product_title LIKE ? OR more_infor_product LIKE ? OR cpu LIKE ? OR gpu LIKE ?";
        
        
        String searchPattern = "%" + keyword + "%";

        try (Connection conn = DBcontext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);
            stmt.setString(3, searchPattern);
            stmt.setString(4, searchPattern);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    
                    Product p = new Product(
                        
                        rs.getInt("id"),
                        rs.getString("product_title"),
                        rs.getDouble("product_price"),
                        rs.getInt("amount_of_product"),
                        rs.getString("more_infor_product"),
                        rs.getString("cpu"),
                        rs.getString("ram"),
                        rs.getString("storage"),
                        rs.getString("gpu"),
                        rs.getString("screen"),
                        rs.getString("battery"),
                        rs.getString("audio"),
                        rs.getString("ports"),
                        rs.getString("wireless"),
                        rs.getString("weight"),
                        rs.getString("color"),
                        rs.getString("conditionn"),
                        rs.getString("warranty"),
                        new ArrayList<>()
                    );
                    products.add(p);
                }
            }
        }
        return products;
    }
}