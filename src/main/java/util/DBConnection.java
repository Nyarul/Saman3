/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// File: src/model/DBConnection.java
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {
    private static final String JDBC_URL = System.getenv("DB_URL");
    private static final String JDBC_USERNAME = System.getenv("DB_USER");
    private static final String JDBC_PASSWORD = System.getenv("DB_PASS");

    public static Connection getConnection() {
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;

    }
}

//public class DBConnection {
//    public static Connection getConnection() throws SQLException, ClassNotFoundException {
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        return DriverManager.getConnection(
//            "jdbc:mysql://localhost:3306/umt_transport_db", 
//            "root", 
//            "admin"
//        );
//    }
//}