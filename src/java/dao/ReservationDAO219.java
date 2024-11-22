package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReservationDAO219 extends DAO219 {

    public int createReservation(String time, String note, int customerId) throws SQLException {
        String query = "INSERT INTO reservation219 (time, note, customer_id) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, time);
            stmt.setString(2, note);
            stmt.setInt(3, customerId);
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return -1;
    }
}
