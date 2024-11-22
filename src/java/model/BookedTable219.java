package model;

import java.util.Date;

public class BookedTable219 {

    private int id;
    private Table219 table;
    private Reservation219 reservation;
    private Date startTime;
    private Date endTime;

    public BookedTable219() {
    }

    public BookedTable219(int id, Table219 table, Reservation219 reservation, Date startTime, Date endTime) {
        this.id = id;
        this.table = table;
        this.reservation = reservation;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Table219 getTable() {
        return table;
    }

    public void setTable(Table219 table) {
        this.table = table;
    }

    public Reservation219 getReservation() {
        return reservation;
    }

    public void setReservation(Reservation219 reservation) {
        this.reservation = reservation;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "BookedTable{"
                + "id=" + id
                + ", table=" + (table != null ? table.getId() : "null")
                + ", reservation=" + (reservation != null ? reservation.getId() : "null")
                + ", startTime=" + startTime
                + ", endTime=" + endTime
                + '}';
    }
}
