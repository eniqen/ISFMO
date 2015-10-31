package model;

import javax.persistence.Entity;
import java.util.Date;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Сущность для работы с Клиентами
 *
 * @version 1.0
 */

@Entity
public class Client extends BaseModel {

    private String firstname;
    private String lastname;
    private Date birthday;
    private String passport;
    private String address;
    private List<Contract> contractList;
    private String email;
    private String password;

    public Client() {
    }

    public Client(String firstname, String lastname, Date birthday, String passport, String address, List<Contract> contractList, String email, String password) {

        this.firstname = firstname;
        this.lastname = lastname;
        this.birthday = birthday;
        this.passport = passport;
        this.address = address;
        this.contractList = contractList;
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

    public List<Contract> getContractList() {
        return contractList;
    }

    public void setContractList(List<Contract> contractList) {
        this.contractList = contractList;
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
}
