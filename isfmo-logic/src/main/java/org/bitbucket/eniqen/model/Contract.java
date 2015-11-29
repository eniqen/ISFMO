package org.bitbucket.eniqen.model;

import javax.persistence.*;
import java.io.Serializable;
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

    @Column(name = "BLOCKED", nullable = false)
    private boolean blocked;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "NUMBER_ID", nullable = false, unique = true)
    private Number number;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TARIFF_ID", nullable = false)
    private Tariff tariff;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CLIENT_ID", nullable = false)
    private Client client;

    @ManyToMany
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

    public void setOptions(Set<Option> optionList) {
        this.options = optionList;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Number getNumber() {
        return number;
    }

    public void setNumber(Number number) {
        this.number = number;
    }

    public Tariff getTariff() {
        return tariff;
    }

    public void setTariff(Tariff tariff) {
        this.tariff = tariff;
    }

    public boolean isBlocked() {
        return blocked;
    }

    public void setBlocked(boolean blocked) {
        this.blocked = blocked;
    }

    public Contract(boolean blocked, Number number, Tariff tariff, Client client, Set<Option> options) {
        this.blocked = blocked;
        this.number = number;
        this.tariff = tariff;
        this.client = client;
        this.options = options;
    }
}
