package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    public List<Categoria> doRetrieveAll() {

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement ps = con.prepareStatement("select id, nome, descrizione from categorie");
            ResultSet rs = ps.executeQuery();

            List<Categoria> categorie = new ArrayList<>();

            while (rs.next()) {

                Categoria c = new Categoria();

                c.setId(rs.getInt(1));
                c.setNome(rs.getString(2));
                c.setDescrizione(rs.getString(3));

                categorie.add(c);
            }

            return categorie;

        } catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }

    public Categoria doRetrieveByName(String nomeCat) {

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement ps = con.prepareStatement("select id, nome, descrizione from categorie where nome = ?");
            ps.setString(1, nomeCat);

            ResultSet rs = ps.executeQuery();
            rs.next();

            int id = rs.getInt(1);
            String nome = rs.getString(2);
            String descrizione = rs.getString(3);

            Categoria categoria = new Categoria();
            categoria.setId(id);
            categoria.setNome(nome);
            categoria.setDescrizione(descrizione);

            return categoria;

        } catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }
}
