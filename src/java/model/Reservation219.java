package model;

import java.util.Date;

public class Reservation219 {

    private int id;
    private Date time;
    private String note;
    private String status;
    private Customer219 customer;

    public Reservation219() {
    }

    public Reservation219(int id, Date time, String note, String status, Customer219 customer) {
        this.id = id;
        this.time = time;
        this.note = note;
        this.status = status;
        this.customer = customer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Customer219 getCustomer() {
        return customer;
    }

    public void setCustomer(Customer219 customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return "Reservation{"
                + "id=" + id
                + ", time='" + time + '\''
                + ", note='" + note + '\''
                + ", status='" + status + '\''
                + ", customer=" + (customer != null ? customer.getId() : "null")
                + '}';
    }
}
