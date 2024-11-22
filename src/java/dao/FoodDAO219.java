package dao;

import model.Food219;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FoodDAO219 extends DAO219 {

    public FoodDAO219() {
        super();
    }

    public ArrayList<Food219> getFoods() {
        ArrayList<Food219> foods = new ArrayList<>();
        String sql = "SELECT id, name, type, ingredients, price, disc FROM food219";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Food219 food = new Food219();
                food.setId(rs.getInt("id"));
                food.setName(rs.getString("name"));
                food.setType(rs.getString("type"));
                food.setIngredients(rs.getString("ingredients"));
                food.setPrice(rs.getFloat("price"));
                food.setDisc(rs.getString("disc"));
                foods.add(food);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return foods;
    }

    public boolean addFood(Food219 food) {
        String sql = "INSERT INTO food219(name, type, ingredients, price, disc) VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, food.getName());
            ps.setString(2, food.getType());
            ps.setString(3, food.getIngredients());
            ps.setFloat(4, food.getPrice());
            ps.setString(5, food.getDisc());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteFood(int id) {
        String sql = "DELETE FROM food219 WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
