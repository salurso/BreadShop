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

                Prodotto p = new Prodotto();
                p.setId(rs.getInt(1));
                p.setNome(rs.getString(2));
                p.setDescrizione(rs.getString(3));
                p.setCosto(rs.getDouble(4));

                prodotti.add(p);
            }

            return prodotti;

        } catch (SQLException s) {

            throw new RuntimeException(s);
        }
    }

    public List<Prodotto> doRetrieveByCategory(int id) {

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement ps =
                    con.prepareStatement("select prodotto.id, prodotto.nome, prodotto.descrizione, prodotto.prezzoCent " +
                            "from prodotto, prodotto_Categoria " +
                            "where prodotto.id = prodotto_Categoria.idProdotto and prodotto_Categoria.idCategoria = ?");

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<Prodotto> prodotti = new ArrayList<>();

            while (rs.next()) {

                Prodotto p = new Prodotto();
                p.setId(rs.getInt(1));
                p.setNome(rs.getString(2));
                p.setDescrizione(rs.getString(3));
                p.setCosto(rs.getDouble(4));

                prodotti.add(p);
            }

            return prodotti;

        } catch (SQLException s) {

            throw new RuntimeException(s);
        }
    }
}
