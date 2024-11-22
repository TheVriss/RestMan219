package model;

public class Table219 {

    private int id;
    private String name;
    private int capacity;
    private String disc;

    public Table219() {
    }

    public Table219(int id, String name, int capacity, String disc) {
        this.id = id;
        this.name = name;
        this.capacity = capacity;
        this.disc = disc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getDisc() {
        return disc;
    }

    public void setDisc(String disc) {
        this.disc = disc;
    }

    @Override
    public String toString() {
        return "Table{"
                + "id=" + id
                + ", name='" + name + '\''
                + ", capacity=" + capacity
                + ", disc='" + disc + '\''
                + '}';
    }
}
