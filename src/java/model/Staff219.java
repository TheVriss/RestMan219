package model;

public class Staff219 extends User219 {

    public Staff219() {
        super();
    }

    public Staff219(int id, String username, String password, String email, String fullName,
            String phoneNumber, String role, String description) {
        super(id, username, password, email, fullName, phoneNumber, role, description);  // Gọi constructor của lớp cha
    }
}
