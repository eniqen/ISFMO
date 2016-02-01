package org.bitbucket.eniqen.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Сущность для работы с Контрактами
 *
 * @version 1.0
 */

@Entity
@Table(name = "CONTRACT_TBL")
@NamedQuery(name = "Contract.getAll", query = "SELECT c FROM Contract c")
public class Contract extends BaseEntity {

//    @Temporal(value = TemporalType.DATE)
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    @Column(name = "CREATEDATE", columnDefinition="TIMESTAMP DEFAULT CURRENT_DATE")
//    private Date createDate;
//
    @Column(name = "ACTIVE", columnDefinition = "boolean default true", nullable = false)
    private Boolean active;

    @OneToOne
    @JoinColumn(name = "PHONENUMBER_ID", nullable = false, unique = true)
    private PhoneNumber phoneNumber;

    @ManyToOne
    @JoinColumn(name = "TARIFF_ID", nullable = false)
    private Tariff tariff;

    @ManyToOne
    @JoinColumn(name = "CLIENT_ID", nullable = false)
    private Client client;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "CONTRACT_OPTION_TBL",
            joinColumns = {@JoinColumn(name = "CONTRACT_ID", referencedColumnName = "ID")},
            inverseJoinColumns = {@JoinColumn(name = "OPTION_ID", referencedColumnName = "ID")})
    private Set<Option> options;

    public Contract() {
    }

    public Set<Option> getOptions() {
        return options;
    }

    public void setOptions(Set<Option> options) {
        this.options = options;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public PhoneNumber getNumber() {
        return phoneNumber;
    }

    public void setNumber(PhoneNumber number) {
        this.phoneNumber = number;
    }

    public Tariff getTariff() {
        return tariff;
    }

    public void setTariff(Tariff tariff) {
        this.tariff = tariff;
    }

//    public Date getCreateDate() {
//        return createDate;
//    }
//
//    public void setCreateDate(Date createDate) {
//        this.createDate = createDate;
//    }
//
    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Contract(PhoneNumber phoneNumber, Tariff tariff, Client client, Set<Option> options) {
        this.phoneNumber = phoneNumber;
        this.tariff = tariff;
        this.client = client;
        this.options = options;
    }

    public Contract(PhoneNumber phoneNumber, Tariff tariff, Client client) {
        this.phoneNumber = phoneNumber;
        this.tariff = tariff;
        this.client = client;
    }
}
