package org.bitbucket.eniqen.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Entity
@Table(name = "ROLE_TBL")
@NamedQuery(name = "Role.getAll", query = "select r from Role r")
public class Role extends BaseEntity{

    @Column(name = "TITLE", unique = true, nullable = false)
    private String title;

    public Role() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "Role{" +
                "title='" + title + '\'' +
                '}';
    }
}
