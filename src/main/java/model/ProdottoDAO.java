package model;

import jakarta.servlet.http.Part;

import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProdottoDAO {

    public List<Prodotto> doRetrieveAll() {

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement ps = con.prepareStatement("select id, nome, prezzo, immagine, nomeCategoria from prodotto");
            ResultSet rs = ps.executeQuery();
            ArrayList<Prodotto> prodotti = new ArrayList<>();

            while (rs.next()){
                Prodotto p = new Prodotto();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setPrice(rs.getDouble(3));
                p.setImage(rs.getString(4));
                p.setNameCategory(rs.getString(5));

                prodotti.add(p);
            }
            return prodotti;

        } catch (SQLException s) {
            throw new RuntimeException(s);
        }
    }

    public boolean doInsertProduct(Prodotto p) throws IOException {

        int result;
            try (Connection con = ConPool.getConnection()) {

                PreparedStatement ps = con.prepareStatement("INSERT INTO prodotto (nome, prezzo, immagine, descrizione, nomeCategoria) VALUES (?, ?, ?, ?, ?)");
                ps.setString(1, p.getName());
                ps.setDouble(2, p.getPrice());
//                ps.setBlob(3, p.getImage());
                ps.setString(3,p.getImage());
                ps.setString(4, p.getDescription());
                ps.setString(5, p.getNameCategory());

                result = ps.executeUpdate();
            } catch (SQLException s) {
                throw new RuntimeException(s);
            }
        return false;
    }

    public List<Prodotto> doRetrieveByCategory(String cat) {

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT id, nome, prezzo, immagine FROM Prodotto  WHERE nomeCategoria = ?");

            ResultSet rs = ps.executeQuery();
            List<Prodotto> prodotti = new ArrayList<>();
            while (rs.next()) {
                Prodotto p = new Prodotto();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setPrice(rs.getDouble(3));
                p.setImage(rs.getString(4));

                prodotti.add(p);
            }
            return prodotti;
        } catch (SQLException s) {
            throw new RuntimeException(s);
        }
    }

    public Prodotto doRetrieveById(int id) {

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT id, nome, prezzo, immagine FROM Prodotto WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            Prodotto p = new Prodotto();
            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
//            p.setDescription(rs.getString(3));
            p.setPrice(rs.getDouble(3));
            p.setImage(rs.getString(4));

            return p;
        } catch (SQLException s) {
            throw new RuntimeException(s);
        }
    }

//    public Prodotto doRetrieveByIdImage(int id) {
//
//        try (Connection con = ConPool.getConnection()) {
//            PreparedStatement ps = con.prepareStatement("SELECT id, nome, descrizione, prezzo, immagine FROM Prodotto WHERE id = ?");
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
////            Blob blob = rs.getBlob("immagine");
////            byte byteArray[] = blob.getBytes(1, (int) blob.length());
//
//            Prodotto p = new Prodotto();
//            p.setId(rs.getInt("id"));
//            p.setName(rs.getString("nome"));
//            p.setDescription(rs.getString("descrizione"));
//            p.setPrice(rs.getDouble("prezzo"));
////            p.setImage((InputStream) blob);
//            InputStream is = rs.getBinaryStream("immagine");
//            p.setImage(is);
////            p.setImage((InputStream) rs.getBlob("immagine"));
//
//            return p;
//        } catch (SQLException s) {
//            throw new RuntimeException(s);
//        }
//    }

}
