package dao;

import model.User219;
import model.Customer219;
import model.Manager219;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO219 extends DAO219 {

    public UserDAO219() {
        super();
    }

    public User219 login(String username, String password) {
        String sql = "SELECT * FROM user219 WHERE username = ? AND password = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role").toLowerCase();
                if ("manager".equals(role)) {
                    Manager219 manager = new Manager219();
                    manager.setId(rs.getInt("id"));
                    manager.setUsername(rs.getString("username"));
                    manager.setPassword(rs.getString("password"));
                    manager.setEmail(rs.getString("email"));
                    manager.setFullName(rs.getString("fullName"));
                    manager.setPhoneNumber(rs.getString("phoneNumber"));
                    manager.setDescription(rs.getString("disc"));
                    return manager;
                } else if ("customer".equals(role)) {
                    Customer219 customer = new Customer219();
                    customer.setId(rs.getInt("id"));
                    customer.setUsername(rs.getString("username"));
                    customer.setPassword(rs.getString("password"));
                    customer.setEmail(rs.getString("email"));
                    customer.setFullName(rs.getString("fullName"));
                    customer.setPhoneNumber(rs.getString("phoneNumber"));
                    customer.setDescription(rs.getString("disc"));
                    return customer;
                } else {
                    return null;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
