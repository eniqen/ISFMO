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

    @Column(name = "NUMBER", length = 11, nullable = false, unique = true)
    private String number;

    @OneToOne(fetch=FetchType.LAZY, mappedBy="phoneNumber")
    private Contract contract;

    public PhoneNumber() {
    }
}
