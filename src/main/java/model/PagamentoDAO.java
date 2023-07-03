package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PagamentoDAO {
    public ArrayList<Pagamento> doRetriveByEmail(String email) {

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT p.* FROM MetodoDiPagamento p, associato a WHERE p.numero=a.numMetodo AND a.emailUtente=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            ArrayList<Pagamento> creditCards = new ArrayList<>();

            while (rs.next()){
                Pagamento p = new Pagamento();
                p.setNumber(rs.getLong(1));
                p.setCvv(Integer.parseInt(rs.getString(2)));
                p.setExpMonth(Integer.parseInt(rs.getString(3)));
                p.setExpYear(Integer.parseInt(rs.getString(4)));
                p.setHolder(rs.getString(5));

                creditCards.add(p);
            }
            return creditCards;

        } catch (SQLException s) {
            throw new RuntimeException(s);
        }
    }

    public Pagamento doRetriveByNumber(long number) {

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM MetodoDiPagamento WHERE numero=?");
            ps.setLong(1, number);
            ResultSet rs = ps.executeQuery();
            Pagamento p = new Pagamento();

            while (rs.next()){
                p.setNumber(rs.getLong(1));
                p.setCvv(Integer.parseInt(rs.getString(2)));
                p.setExpMonth(Integer.parseInt(rs.getString(3)));
                p.setExpYear(Integer.parseInt(rs.getString(4)));
                p.setHolder(rs.getString(5));
            }
            return p;

        } catch (SQLException s) {
            throw new RuntimeException(s);
        }
    }
}
