package org.bitbucket.eniqen.model;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 */
import javax.persistence.*;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by sevasan on 2/15/2015.
 */

@Entity
@Table(name = "users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_users", unique = true, nullable = false)
    private long userID;

    @Column(name = "name_users", length = 45)
    private String userName;

    @Column(name = "lastname_users", length = 45)
    private String userLastName;

    @Temporal(TemporalType.DATE)
    @Column(name = "birthdate_users")
    private Date userBirthday;

    @Column(name = "ID_card_users")
    private String userIDCard;

    @Column(name = "address_users")
    private String userAddress;

    @Column(name = "email_users", unique = true)
    private String userEmail;

    @Column(name = "password_users")
    private String userPassword;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "role_users")
    private Role userRole;

    public long getUserID() {
        return this.userID;
    }
    public void setUserID(long userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return this.userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserLastName() {
        return this.userLastName;
    }
    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public Date getUserBirthday() {
        return this.userBirthday;
    }
    public void setUserBirthday(Date userBirthday) {
        this.userBirthday = userBirthday;
    }

    public String getUserIDCard() {
        return this.userIDCard;
    }
    public void setUserIDCard(String userIDCard) {
        this.userIDCard = userIDCard;
    }

    public String getUserAddress() {
        return this.userAddress;
    }
    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserEmail() {
        return this.userEmail;
    }
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return this.userPassword;
    }
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Role getRole() {
        return this.userRole;
    }
    public void setRole(Role userRole) {
        this.userRole = userRole;
    }
}
