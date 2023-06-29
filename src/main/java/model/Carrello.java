package model;

import java.util.ArrayList;

public class Carrello {
    private String email;
    private Prodotto products;
    private int quantity;
    private double total;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Prodotto getProducts() {
        return products;
    }

    public void setProducts(Prodotto products) {
        this.products = products;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total =total;
    }
}