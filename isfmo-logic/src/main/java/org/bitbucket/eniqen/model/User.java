package org.bitbucket.eniqen.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Created by Mikhail on 05.01.2016.
 */
@Entity
@Table
@NamedQueries({@NamedQuery(name = "User.getAll", query = "select u from User u"),
        @NamedQuery(name = "findUserByUsername", query = "select u from User u where u.username=:username")})
public class User extends BaseEntity implements UserDetails {

    @Column(name = "USERNAME")
    private String username;

    @Column(name = "PASSWORD")
    private String password;

    @Column(name = "ENABLED", nullable = false, columnDefinition = "TINYINT(1)")
    private boolean enabled;

    @Column(name = "AVATAR")
    @Lob
    @Basic(fetch = FetchType.LAZY)
    private byte[] avatar;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "USER_ROLES_TBL",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"))
    private Set<UserRole> userRoles;

    @OneToOne(optional = false)
    @JoinColumn(name="CLIENT_ID", unique = true, nullable = false, updatable = false)
    private Client client;

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public byte[] getAvatar() {
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
    }

    public Set<UserRole> getUserRoles() {
        return userRoles;
    }

    public void setUserRoles(Set<UserRole> userRoles) {
        this.userRoles = userRoles;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.userRoles.stream().map(userRole -> new SimpleGrantedAuthority(userRole.getRole().name())).collect(Collectors.toList());
    }

    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public String getUsername() {
        return this.username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return this.enabled;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return this.enabled;
    }

    @Override
    public boolean isEnabled() {
        return this.enabled;
    }
}
