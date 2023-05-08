package model;

public class Categoria {

    public void setId(int id){

        this.id = id;
    }

    public int getId(){

        return id;
    }

    public void setNome(String nome) {

        this.nome = nome;
    }

    public String getNome() {

        return nome;
    }

    public void setDescrizione(String descrizione) {

        this.descrizione = descrizione;
    }

    public String getDescrizione(){

        return descrizione;
    }

    private int id;
    private String nome, descrizione;
}
