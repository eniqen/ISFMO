package org.bitbucket.eniqen.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Mikhail on 29.11.2015.
 */

@Entity
@Table(name = "PHONENUMBER_TBL")
@NamedQuery(name = "PhoneNumber.getAll", query = "select n from PhoneNumber n")
public class PhoneNumber extends BaseEntity {

    @Column(name = "PHONENUMBER", length = 11, nullable = false, unique = true)
    private String number;

    @OneToOne(fetch=FetchType.LAZY, mappedBy="phoneNumber", cascade = CascadeType.ALL)
    private Contract contract;

    public PhoneNumber() {
    }

    public PhoneNumber(String number) {
        this.number = number;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }
}
