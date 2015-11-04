package org.bitbucket.eniqen.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Entity
@Table(name = "ROLE_TBL")
public class Role implements Serializable {
    @Id
    @Column(name = "ID", unique = true, nullable = false, length = 1)
    private Integer id;
    @Column(name = "TITLE" , unique = true, nullable = false)
    private String title;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Role() {
    }

    public Role(Integer id, String title) {
        this.id = id;
        this.title = title;
    }
}
