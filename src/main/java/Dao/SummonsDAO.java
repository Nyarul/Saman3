/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// File: src/model/SummonsDAO.java
package Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Summons;
import util.DBConnection;

public class SummonsDAO {

    public boolean issueSummons(String matricNo, int staffId, String violationType, String location) throws SQLException, ClassNotFoundException {
        if (matricNo == null || matricNo.trim().isEmpty()) {
            System.err.println("Matric number is empty");
            return false;
        }
        if (violationType == null || violationType.trim().isEmpty()) {
            System.err.println("Violation type is empty");
            return false;
        }

        String sql = "INSERT INTO summons (vehicle_id, issued_by, violation_type, location, amount) "
                + "SELECT v.id, ?, ?, ?, 50.0 "
                + "FROM vehicles v "
                + "JOIN users u ON v.user_id = u.id "
                + "WHERE u.matric_no = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, staffId);        // Set staff ID who is issuing the summons
            pstmt.setString(2, violationType); // Set violation type
            pstmt.setString(3, location);     // Set location
            pstmt.setString(4, matricNo);     // Set matric number

            int rowsAffected = pstmt.executeUpdate(); // Execute the insert statement
            return rowsAffected > 0; // Return true if at least one row was inserted
        } catch (SQLException e) {
            System.err.println("SQL Error issuing summons: " + e.getMessage());
            return false;
        }
    }

    public List<Summons> getSummonsForStudent(int userId) {
        List<Summons> summonsList = new ArrayList<>();
        String sql = "SELECT s.* FROM summons s "
                + "JOIN vehicles v ON s.vehicle_id = v.id "
                + "WHERE v.user_id = ? ";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Summons summons = new Summons();
                summons.setId(rs.getInt("id"));
                summons.setVehicleId(rs.getInt("vehicle_id"));
                summons.setIssuedBy(rs.getInt("issued_by"));
                summons.setViolationType(rs.getString("violation_type"));
                summons.setLocation(rs.getString("location"));
                summons.setAmount(rs.getDouble("amount"));
                summons.setStatus(rs.getString("status"));
                summons.setIssuedAt(rs.getTimestamp("issued_at"));
                summons.setPaidAt(rs.getTimestamp("paid_at"));
                summonsList.add(summons);
            }
        } catch (SQLException e) {
            System.err.println("SQL Error fetching summons: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.err.println("Database driver not found: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("General error: " + e.getMessage());
        }
        return summonsList;
    }

    public void updateSummonStatus(int summonId, String status) {
        String sql = "UPDATE summons SET status = ? WHERE id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, status);
            pstmt.setInt(2, summonId);
            
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("SQL Error fetching summons: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.err.println("Database driver not found: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("General error: " + e.getMessage());
        }
    }
}
