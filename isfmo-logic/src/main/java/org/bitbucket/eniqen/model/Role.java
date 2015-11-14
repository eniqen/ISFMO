package org.bitbucket.eniqen.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Entity
@Table(name = "ROLE_TBL")
public class Role implements Serializable {

    private static final long serialVersionUID = -2456384787174634222L;

    @Id
    @Column(name = "ID", unique = true, nullable = false, length = 1)
    private Long id;

    @Column(name = "TITLE", unique = true, nullable = false)
    private String title;

    public Role() {
    }

    public Role(Long id, String title) {
        this.id = id;
        this.title = title;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
                "id=" + id +
                ", title='" + title + '\'' +
                '}';
    }
}
