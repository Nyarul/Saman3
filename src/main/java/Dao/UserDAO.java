/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// File: src/model/UserDAO.java
package Dao;

import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class UserDAO {
    // Student registration
    public boolean registerStudent(User user, String plateNumber) {
        String sql = "INSERT INTO users (matric_no, role, password, full_name, email, phone) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setString(1, user.getMatricNo());
            pstmt.setString(2, "student");
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getFullName());
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getPhone());
            pstmt.executeUpdate();
            
            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                int userId = rs.getInt(1);
                return addVehicle(userId, plateNumber);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Add vehicle for student
    private boolean addVehicle(int userId, String plateNumber) {
        String sql = "INSERT INTO vehicles (user_id, plate_number) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            pstmt.setString(2, plateNumber);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // User login
    public User login(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setMatricNo(rs.getString("matric_no"));
                user.setRole(rs.getString("role"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Get all students (for admin)
    public List<User> getAllStudents() {
        List<User> students = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role = 'student'";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setMatricNo(rs.getString("matric_no"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                students.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }

    public boolean deleteUser(int userId) {
    String deleteVehicleSQL = "DELETE FROM vehicles WHERE user_id = ?";
    String deleteUserSQL = "DELETE FROM users WHERE id = ?";
    try (Connection conn = DBConnection.getConnection()) {
        conn.setAutoCommit(false); // Ensure both deletes are done together

        try (PreparedStatement deleteVehicle = conn.prepareStatement(deleteVehicleSQL);
             PreparedStatement deleteUser = conn.prepareStatement(deleteUserSQL)) {

            deleteVehicle.setInt(1, userId);
            deleteVehicle.executeUpdate();

            deleteUser.setInt(1, userId);
            int rows = deleteUser.executeUpdate();

            conn.commit();
            return rows > 0;
        } catch (Exception e) {
            conn.rollback(); // rollback in case of error
            e.printStackTrace();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

}