package org.bitbucket.eniqen.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Mikhail on 29.11.2015.
 */

@Entity
@Table(name = "NUMBER_TBL")
@NamedQuery(name = "Number.getAll", query = "select n from Number n")
public class Number extends BaseEntity {

    @Column(name = "NUMBER", length = 11, nullable = false, unique = true)
    private String number;

    @OneToOne(fetch=FetchType.LAZY, mappedBy="number")
    private Contract contract;

    public Number() {
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Number(String number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Number{" +
                "number='" + number + '\'' +
                ", contract=" + contract +
                '}';
    }
}
