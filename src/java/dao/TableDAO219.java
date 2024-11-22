package dao;

import model.Table219;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

public class TableDAO219 extends DAO219 {

    public TableDAO219() {
        super();
    }

    public ArrayList<Table219> findAvailableTables(String dateStr, String startTimeStr, String endTimeStr, String capacity) {
        ArrayList<Table219> availableTables = new ArrayList<>();
        String sql = """
    SELECT t.id, t.name, t.capacity, t.disc
    FROM table219 t
    WHERE t.id NOT IN (
        SELECT b.table_id
        FROM bookedtable219 b
        WHERE b.start_time < ? AND b.end_time > ?
    )
    AND t.capacity >= ?;
    """;

        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = dateFormat.parse(dateStr);
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            java.util.Date startTime = timeFormat.parse(startTimeStr);
            java.util.Date endTime = timeFormat.parse(endTimeStr);

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.set(Calendar.HOUR_OF_DAY, startTime.getHours());
            calendar.set(Calendar.MINUTE, startTime.getMinutes());
            Timestamp sqlStartTime = new Timestamp(calendar.getTimeInMillis());

            calendar.set(Calendar.HOUR_OF_DAY, endTime.getHours());
            calendar.set(Calendar.MINUTE, endTime.getMinutes());
            Timestamp sqlEndTime = new Timestamp(calendar.getTimeInMillis());

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setTimestamp(1, sqlEndTime);
            ps.setTimestamp(2, sqlStartTime);
            ps.setInt(3, Integer.parseInt(capacity));

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Table219 table = new Table219();
                table.setId(rs.getInt("id"));
                table.setName(rs.getString("name"));
                table.setCapacity(rs.getInt("capacity"));
                table.setDisc(rs.getString("disc"));
                availableTables.add(table);
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return availableTables;
    }

    public Table219 findTableById(int tableId) {
        Table219 table = null;
        String sql = "SELECT id, name, capacity, disc FROM table219 WHERE id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, tableId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                table = new Table219();
                table.setId(rs.getInt("id"));
                table.setName(rs.getString("name"));
                table.setCapacity(rs.getInt("capacity"));
                table.setDisc(rs.getString("disc"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return table;
    }
}
