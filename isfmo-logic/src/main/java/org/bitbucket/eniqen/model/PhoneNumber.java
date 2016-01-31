package org.bitbucket.eniqen.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import javax.validation.constraints.Size;

/**
 * Created by Mikhail on 29.11.2015.
 */

@Entity
@Table(name = "PHONENUMBER_TBL")
@NamedQueries({
        @NamedQuery(name = "PhoneNumber.getAll", query = "select n from PhoneNumber n")
})
public class PhoneNumber extends BaseEntity {

    @Column(name = "PHONENUMBER", length = 11, nullable = false, unique = true)
    private String number;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "phoneNumber")
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

    @JsonIgnore
    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }
}
