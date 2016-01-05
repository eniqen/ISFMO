package org.bitbucket.eniqen.model;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Entity
@Table(name = "ROLE_TBL")
@NamedQuery(name = "Role.getAll", query = "select r from UserRole r")
public class UserRole extends BaseEntity {

    @Column(name = "TITLE", unique = true, nullable = false)
    @Enumerated(EnumType.STRING)
    private Role role;

    @ManyToMany(fetch = FetchType.EAGER, mappedBy = "userRoles")
    private Set<User> users;

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
