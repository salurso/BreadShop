package model;

public class Prodotto {

    public void setId(int id) {

        this.id = id;
    }

    public int getId() {

        return id;
    }

    public void setNome(String nome) {

        this.nome = nome;
    }

    public String getNome() {

        return nome;
    }

    public String getDescrizione() {

        return descrizione;
    }

    public void setDescrizione(String descrizione) {

        this.descrizione = descrizione;
    }

    public void setCosto(double costo) {

        this.costo = costo;
    }

    public double getCosto() {

        return costo;
    }

    private int id;
    private String nome, descrizione;
    private double costo;
}
