package model;

public class Food219 {

    private int id;
    private String name;
    private String type;
    private String ingredients;
    private float price;
    private String disc;

    public Food219() {
    }

    public Food219(String name, String type, String ingredients, float price, String disc) {
        this.name = name;
        this.type = type;
        this.ingredients = ingredients;
        this.price = price;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDisc() {
        return disc;
    }

    public void setDisc(String disc) {
        this.disc = disc;
    }

    @Override
    public String toString() {
        return "Food{"
                + "id=" + id
                + ", name='" + name + '\''
                + ", type='" + type + '\''
                + ", ingredients='" + ingredients + '\''
                + ", price=" + price
                + ", disc='" + disc + '\''
                + '}';
    }
}
