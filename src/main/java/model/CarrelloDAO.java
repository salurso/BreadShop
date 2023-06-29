package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CarrelloDAO {

    //totale double NOT NULL,
    public ArrayList<Carrello> doRetrieveAll(){
        try (Connection con = ConPool.getConnection()) {

            PreparedStatement ps = con.prepareStatement("SELECT * FROM Carrello");
            ResultSet rs = ps.executeQuery();
            ArrayList<Carrello> carts = new ArrayList<>();

            while (rs.next()){
                Carrello c = new Carrello();
                c.setEmail(rs.getString(1));
                c.setProducts(this.doRetrieveProductsCart(rs.getInt(2)));
                c.setQuantity(rs.getInt(3));
                c.setTotal(rs.getDouble(4));

                carts.add(c);
            }
            return carts;

        } catch (SQLException s) {
            throw new RuntimeException(s);
        }
    }

    private Prodotto doRetrieveProductsCart(int id){
        try (Connection con = ConPool.getConnection()) {

            PreparedStatement ps = con.prepareStatement("SELECT idProdotto p, nome p, prezzo p, immagine p, nomeCategoria p FROM carrello c, prodotto p WHERE c.idProdotto = p.id");
            ResultSet rs = ps.executeQuery();

            Prodotto p = new Prodotto();
            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
            p.setPrice(rs.getDouble(3));
            p.setImage(rs.getString(4));
            p.setNameCategory(rs.getString(5));

            return p;

        } catch (SQLException s) {
            throw new RuntimeException(s);
        }
    }


    public int doInsert(String email, int id, int quantity, double priceProduct) throws IOException {
        int result;
        try (Connection con = ConPool.getConnection()) {

            PreparedStatement ps1 = con.prepareStatement("SELECT totale FROM Carrello");
            ResultSet rs = ps1.executeQuery();

            double price = rs.getDouble(1)+(priceProduct*quantity);

            PreparedStatement ps = con.prepareStatement("INSERT INTO carrello (emailUtente, idProdotto, quantita, totale) VALUES (?, ?, ?, ?)");
            ps.setString(1, email);
            ps.setInt(2, id);
            ps.setInt(3, quantity);
            ps.setDouble(4, price);

            return result = ps.executeUpdate();
        } catch (SQLException s) {
            throw new RuntimeException(s);
        }
    }
}