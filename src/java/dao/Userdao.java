/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.User;
import context.DBcontext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Userdao {

    private static final String INSERT_USER_SQL =

            "INSERT INTO Users (fullName, phone, passWord, email, userName, idRole) VALUES (?, ?, ?, ?, ?,?)";

    private static final String LOGIN_SQL = "SELECT id, fullName, userName, email, phone,idRole FROM Users WHERE email = ? AND passWord = ?";

    public boolean registerUser(User user) {
        try (Connection connection = context.DBcontext.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {

            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getPhone());
            preparedStatement.setString(3, user.getPassWord());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getUserName());
            preparedStatement.setInt(6, user.getRoleId());

            int result = preparedStatement.executeUpdate();
            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User loginUser(String email, String password) {
        try (Connection connection = DBcontext.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(LOGIN_SQL)) {

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {

                User user = new User();
                user.setID(rs.getInt("id"));
                user.setFullName(rs.getString("fullname"));
                user.setUserName(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRoleId(rs.getInt("idRole"));
                return user;
            }
        } catch (SQLException e) {
            System.err.println("Lỗi DAO khi đăng nhập: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
