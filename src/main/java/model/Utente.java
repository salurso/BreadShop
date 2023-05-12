package model;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
public class Utente {

//    private int id;
    private String email;
    private String name;
    private String surname;
    private String username;
    private int phone_number;
    private String city;
    private String street;
    private int street_number;
    private String province;
    private int cap;
    private boolean admin;
    private String password;


    // metodi getter e setter
    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setPhone_number(int phone_number) {
        this.phone_number = phone_number;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public void setStreet_number(int street_number) {
        this.street_number = street_number;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public void setCap(int cap) {
        this.cap = cap;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public void setPassword(String password) {
        try {
            MessageDigest digest =
                    MessageDigest.getInstance("SHA-1");
            digest.reset();
            digest.update(password.getBytes(StandardCharsets.UTF_8));
            this.password = String.format("%040x", new BigInteger(1, digest.digest()));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

//    public String getUsername() {
//        return username;
//    }
//
//    public void setUsername(String username) {
//        this.username = username;
//    }


    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public int getPhone_number() {
        return phone_number;
    }

    public String getCity() {
        return city;
    }

    public String getStreet() {
        return street;
    }

    public int getStreet_number() {
        return street_number;
    }

    public String getProvince() {
        return province;
    }

    public int getCap() {
        return cap;
    }

    public boolean isAdmin() {
        return admin;
    }

    public String getPassword() {
        return password;
    }







//    public int getId() {
//        return id;
//    }

//    public void setId(int id) {
//        this.id = id;
//    }
}

