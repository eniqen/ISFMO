package org.bitbucket.eniqen.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Entity
@Table(name = "ROLE_TBL")
@NamedQuery(name = "Role.getAll", query = "select r from Role r")
public class Role extends BaseEntity {

    @Column(name = "TITLE", unique = true, nullable = false)

    @Enumerated(EnumType.STRING)
    private RoleType roleType;

    public Role() {
    }

    public RoleType getTitle() {
        return roleType;
    }

    public void setTitle(RoleType roleType) {
        this.roleType = roleType;
    }

    public Role(RoleType roleType) {
        this.roleType = roleType;
    }

    @Override
    public String toString() {
        return "Role{" +
                "roleType='" + roleType + '\'' +
                '}';
    }
}
