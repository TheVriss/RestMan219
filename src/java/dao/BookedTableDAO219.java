package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookedTableDAO219 extends DAO219 {

    public void createBookedTable(int tableId, int reservationId, String startTime, String endTime) throws SQLException {
        String query = "INSERT INTO bookedtable219 (table_id, reservation_id, start_time, end_time) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, tableId);
            stmt.setInt(2, reservationId);
            stmt.setString(3, startTime);
            stmt.setString(4, endTime);
            stmt.executeUpdate();
        }
    }
}
