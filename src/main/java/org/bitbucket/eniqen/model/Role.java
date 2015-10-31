package org.bitbucket.eniqen.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Сущность для работы с Ролями
 *
 * @version 1.0
 */
@Entity
@Table(name = "ROLE_TBL")
public class Role implements Serializable {
    @Id
    @Column(name = "ID")
    private Integer id;
    @Column(name = "TITLE")
    private String name;

    public Role(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Role() {
    }
}
