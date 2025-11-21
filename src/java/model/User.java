/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Welcome to Windows10
 */
public class User {
    private int id;
    private String fullname;
    private String username;
    private String password;
    private String email;
    private String phone;
    private int roleId;

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public User() {

    }

    public User(String fullname, String email, String phone, String password) {
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.username = email;
        this.roleId = 2; // Default role ID for regular users
    }

    public void setID(int id) {
        this.id = id;
    }

    public int getID() {
        return this.id;
    }

    public void setFullName(String fullname) {
        this.fullname = fullname;
    }

    public String getFullName() {
        return this.fullname;
    }

    public void setUserName(String username) {
        this.username = username;
    }

    public String getUserName() {
        return this.username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return this.email;
    }

    public void setPassWord(String password) {
        this.password = password;
    }

    public String getPassWord() {
        return this.password;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return this.phone;
    }
}
