package model;

import java.io.InputStream;

public class Prodotto {

    private int id;
    private String name;
    private double price;
    private String description;
    private String nameCategory;
    private InputStream image;


    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setIdCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }

    public void setImage(InputStream image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public InputStream getImage() {
        return image;
    }
}
