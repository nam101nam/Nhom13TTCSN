/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

/**
 *
 * @author Welcome to Windows10
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBcontext {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/userdb";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "123456";
    
    public static Connection getConnection() {
        Connection conn = null;
        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            
        } catch (ClassNotFoundException e) {
            System.err.println("Loi driver, hay kiem tra thu vien MySQL Connector");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Loi ket noi DB. Kiem tra Server/URL/User/Pass");
            e.printStackTrace();
        }
        return conn;
    }
}
