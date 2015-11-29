package org.bitbucket.eniqen.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Mikhail on 29.11.2015.
 */

@Entity
@Table(name = "NUMBER_TBL")
@NamedQuery(name = "Number.getAll", query = "select n from Number n")
public class Number implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", unique = true, nullable = false)
    private Long id;

    @Column(name = "NUMBER", length = 11, nullable = false, unique = true)
    private String number;

    public Number() {
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
}
