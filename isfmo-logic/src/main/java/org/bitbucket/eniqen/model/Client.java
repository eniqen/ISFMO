package org.bitbucket.eniqen.model;


import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Сущность для работы с Клиентами
 *
 * @version 1.0
 */

@Entity
@Table(name = "CLIENT_TBL")
@NamedQuery(name = "Client.getAll", query = "SELECT c FROM Client c")
public class Client extends BaseEntity {

    @Column(name = "FIRSTNAME", length = 50, nullable = false)
    private String firstname;

    @Column(name = "LASTNAME", length = 50, nullable = false)
    private String lastname;

    @Column(name = "BIRTHDAY", nullable = true)
    @Temporal(value = TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date birthday;

    @Column(name = "PASSPORT", unique = true, nullable = false, length = 12)
    private String passport;

    @Column(name = "ADDRESS", length = 100, nullable = false)
    private String address;

    @Column(name = "EMAIL", unique = true, length = 64, nullable = false)
    private String email;

    @Column(name = "PASSWORD", length = 20, nullable = false)
    private String password;

    public Client() {
    }

    public Client(String firstname, String lastname, Date birthday, String passport, String address, String email, String password) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.birthday = birthday;
        this.passport = passport;
        this.address = address;
        this.email = email;
        this.password = password;
    }


    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Client{" +
                "firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", birthday=" + birthday +
                ", passport='" + passport + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}

