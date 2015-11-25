package org.bitbucket.eniqen.model;


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
public class Client implements Serializable {
    private static final long serialVersionUID = -5258599731511643040L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", unique = true, nullable = false)
    private Long id;

    @Column(name = "FIRSTNAME", length = 50, nullable = false)
    private String firstname;

    @Column(name = "LASTNAME", length = 50, nullable = false)
    private String lastname;

    @Column(name = "BIRTHDAY", nullable = false)
    @Temporal(value = TemporalType.DATE)
    private Date birthday;

    @Column(name = "PASSPORT", unique = true, nullable = false, length = 12)
    private String passport;

    @Column(name = "ADDRESS", length = 100, nullable = false)
    private String address;

    @Column(name = "EMAIL", unique = true, length = 64, nullable = false)
    private String email;

    @Column(name = "PASSWORD", length = 20, nullable = false)
    private String password;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "ROLE_ID", nullable = false)
    private RoleType role;

    public Client() {
    }

    public Client(String firstname, String lastname, Date birthday, String passport, String address, String email, String password, RoleType role) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.birthday = birthday;
        this.passport = passport;
        this.address = address;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public RoleType getRole() {
        return role;
    }

    public void setRole(RoleType role) {
        this.role = role;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
                "id=" + id +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", birthday=" + birthday +
                ", passport='" + passport + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", role=" + role + '}';
    }
}
