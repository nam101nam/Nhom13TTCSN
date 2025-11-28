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

    // For Admin CRUD
    private static final String INSERT_USER_BY_ADMIN_SQL = "INSERT INTO Users (fullName, phone, passWord, email, userName, idRole) VALUES (?, ?, ?, ?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "SELECT id, fullName, userName, email, phone, idRole FROM Users WHERE id = ?";
    private static final String SELECT_ALL_USERS = "SELECT id, fullName, userName, email, phone, idRole FROM Users";
    private static final String DELETE_USER_SQL = "DELETE FROM Users WHERE id = ?;";
    private static final String UPDATE_USER_SQL = "UPDATE Users SET fullName = ?, phone = ?, email = ?, userName = ?, idRole = ? WHERE id = ?;";

    public void insertUser(User user) throws SQLException {
        try (Connection connection = context.DBcontext.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_BY_ADMIN_SQL)) {
            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getPhone());
            preparedStatement.setString(3, user.getPassWord());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getUserName());
            preparedStatement.setInt(6, user.getRoleId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User selectUser(int id) {
        User user = null;
        try (Connection connection = context.DBcontext.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String fullName = rs.getString("fullName");
                String userName = rs.getString("userName");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                int roleId = rs.getInt("idRole");
                user = new User();
                user.setID(id);
                user.setFullName(fullName);
                user.setUserName(userName);
                user.setEmail(email);
                user.setPhone(phone);
                user.setRoleId(roleId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public java.util.List<User> selectAllUsers() {
        java.util.List<User> users = new java.util.ArrayList<>();
        try (Connection connection = context.DBcontext.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("fullName");
                String userName = rs.getString("userName");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                int roleId = rs.getInt("idRole");
                User user = new User();
                user.setID(id);
                user.setFullName(fullName);
                user.setUserName(userName);
                user.setEmail(email);
                user.setPhone(phone);
                user.setRoleId(roleId);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = context.DBcontext.getConnection();
                PreparedStatement statement = connection.prepareStatement(UPDATE_USER_SQL)) {
            statement.setString(1, user.getFullName());
            statement.setString(2, user.getPhone());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getUserName());
            statement.setInt(5, user.getRoleId());
            statement.setInt(6, user.getID());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = context.DBcontext.getConnection();
                PreparedStatement statement = connection.prepareStatement(DELETE_USER_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
