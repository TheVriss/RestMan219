package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DAO219 {

    public static Connection con;

    public DAO219() {
        if (con == null) {
            String dbUrl = "jdbc:mysql://localhost:3306/rm?autoReconnect=true&useSSL=false";
            String dbClass = "com.mysql.cj.jdbc.Driver";
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection(dbUrl, "root", "theviet2003");

                if (con != null) {
                    System.out.println("MySQL connection successful!");
                    printAllTables();
                } else {
                    System.out.println("MySQL connection failed!");
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error when connecting to MySQL: " + e.getMessage());
            }
        }
    }

    public void printAllTables() {
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt = con.createStatement();
            String sql = "SHOW TABLES";
            rs = stmt.executeQuery(sql);

            System.out.println("List of all tables in the database:");
            while (rs.next()) {
                String tableName = rs.getString(1);
                System.out.println(tableName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        new DAO219();
    }
}
