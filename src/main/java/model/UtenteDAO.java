package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UtenteDAO {

    public static Utente doRetrieveByEmailPassword(String email, String password) {

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Utente utente = null;

        if(email==null || password==null)
            return utente;

        try (Connection connection = ConPool.getConnection()) {
            statement = connection.prepareStatement("SELECT * FROM utente WHERE email=? AND password=SHA1(?)");
            statement.setString(1, email);
            statement.setString(2, password);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                utente = new Utente();
                utente.setEmail(resultSet.getString("email"));
                utente.setName(resultSet.getString("nome"));
                utente.setSurname(resultSet.getString("cognome"));
                utente.setAdmin(resultSet.getBoolean("admin"));
                utente.setPassword(password);
            }
        }  catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return utente;
    }

    public static void doRegistration(Utente utente) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO utente (email, nome, cognome, admin, password) VALUES (?,?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, utente.getEmail());
            ps.setString(2, utente.getName());
            ps.setString(3, utente.getSurname());
            ps.setBoolean(4, false);
            ps.setString(5, utente.getPassword());

            if (ps.executeUpdate() != 1)
                throw new RuntimeException("Errore nel definire l'utente");
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean checkEmail(String email){
        try (Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("SELECT email FROM utente WHERE email= ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public List<Utente> doRetrieveAll(){
        try (Connection con = ConPool.getConnection()) {

            PreparedStatement ps = con.prepareStatement("select nome, cognome, email from utente WHERE NOT nome <> admin");
            ResultSet rs = ps.executeQuery();
            ArrayList<Utente> user = new ArrayList<>();

            while (rs.next()){
                Utente u = new Utente();
                u.setName(rs.getString(1));
                u.setSurname(rs.getString(2));
                u.setEmail(rs.getString(3));


                user.add(u);
            }
            return user;

        } catch (SQLException s) {
            throw new RuntimeException(s);
        }
    }
}
