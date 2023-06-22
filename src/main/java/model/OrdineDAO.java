package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrdineDAO {
    public
    List<Ordine> doRetrieveAll(){
        try (Connection con = ConPool.getConnection()) {

            PreparedStatement ps = con.prepareStatement("select id, data, totale, citta, via, num_civico, provincia, cap, emailUtente from ordine");
            ResultSet rs = ps.executeQuery();
            ArrayList<Ordine> orders = new ArrayList<>();

            while (rs.next()){
                Ordine o = new Ordine();
                o.setId(rs.getInt(1));
                o.setDate(rs.getDate(2));
                o.setTotal(rs.getDouble(3));
                o.setCity(rs.getString(4));
                o.setVia(rs.getString(5));
                o.setHouse_number(rs.getInt(6));
                o.setProvince(rs.getString(7));
                o.setCap(rs.getInt(8));
                o.setEmail_user(rs.getString(9));
                o.setProducts(this.doRetrieveProductsOrder(o.getId()));

                orders.add(o);
            }
            return orders;

        } catch (SQLException s) {
            throw new RuntimeException(s);
        }
    }

    private ArrayList<Prodotto> doRetrieveProductsOrder(int id){
        try (Connection con = ConPool.getConnection()) {

            PreparedStatement ps = con.prepareStatement("select idProdotto a, nome p, prezzo p, immagine p, nomeCategoria p from appartiene a, prodotto p WHERE a.idProdotto = p.id");
            ResultSet rs = ps.executeQuery();
            ArrayList<Prodotto> prodotti = new ArrayList<>();

            while (rs.next()){
                Prodotto p = new Prodotto();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setPrice(rs.getDouble(3));
                p.setImage(rs.getString(4));
                p.setNameCategory(rs.getString(5));
                p.setDescription(rs.getString(6));


                prodotti.add(p);
            }
            return prodotti;

        } catch (SQLException s) {
            throw new RuntimeException(s);
        }
    }
}
