/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// File: src/model/User.java
package model;

public class User {
    private int id;
    private String matricNo;
    private String staffId;
    private String role;
    private String password;
    private String fullName;
    private String email;
    private String phone;

    // Getters and setters
    public int getId() { 
        return id;
    }
    public void setId(int id) { 
        this.id = id;
    }
    public String getMatricNo() {
        return matricNo; 
    }
    public void setMatricNo(String matricNo) {
        this.matricNo = matricNo; 
    }
    public String getStaffId() {
        return staffId;
    }
    public void setStaffId(String staffId) { 
        this.staffId = staffId; 
    }
    public String getRole() { 
        return role; 
    }
    public void setRole(String role) { 
        this.role = role; 
    }
    public String getPassword() { 
        return password; 
    }
    public void setPassword(String password) {
        this.password = password; 
    }
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) { 
        this.fullName = fullName;
    }
    public String getEmail() {
        return email; 
    }
    public void setEmail(String email) { 
        this.email = email; 
    }
    public String getPhone() {
        return phone; 
    }
    public void setPhone(String phone) { 
        this.phone = phone; 
    }
}
