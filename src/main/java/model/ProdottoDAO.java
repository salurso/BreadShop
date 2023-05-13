package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProdottoDAO {

    public List<Prodotto> doRetrieveAll() {

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement ps = con.prepareStatement("select id, nome, descrizione, prezzoCent from prodotto");
            ResultSet rs = ps.executeQuery();
            List<Prodotto> prodotti = new ArrayList<>();

            while (rs.next()) {

//                Prodotto p = new Prodotto();
//                p.setId(rs.getInt(1));
//                p.setNome(rs.getString(2));
//                p.setDescrizione(rs.getString(3));
//                p.setCosto(rs.getDouble(4));

//                prodotti.add(p);
            }

            return prodotti;

        } catch (SQLException s) {

            throw new RuntimeException(s);
        }
    }

    public List<Prodotto> doRetrieveByCategory(String cat) {

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT id, nome, descrizione, prezzo FROM Prodotto p, Categoria c WHERE p.nomeCategoria = c.nome AND c.nome = ?");

            ResultSet rs = ps.executeQuery();
            List<Prodotto> prodotti = new ArrayList<>();
            while (rs.next()) {
                Prodotto p = new Prodotto();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setPrice(rs.getDouble(4));

                prodotti.add(p);
            }
            return prodotti;
        } catch (SQLException s) {
            throw new RuntimeException(s);
        }
    }
}
