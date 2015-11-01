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
public class Contract implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID", unique = true, nullable = false)
    private Integer id;
    @Column(name = "NUMBER", length = 11, unique = true, nullable = false)
    private String number;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TARIFF_TBL_ID", nullable = false)
    private Tariff tariff;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CLIENT_TBL_ID", nullable = false)
    private Client client;
    @ManyToMany
    @JoinTable(
            name = "CONTRACT_OPTION_TBL",
            joinColumns = {@JoinColumn(name = "CONTRACT_ID", referencedColumnName = "ID")},
            inverseJoinColumns = {@JoinColumn(name = "OPTION_ID", referencedColumnName = "ID")})
    private Set<Option> options;

    public Set<Option> getOptions() {
        return options;
    }

    public Client getClient() {
        return client;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public void setOptions(Set<Option> optionList) {
        this.options = optionList;
    }

    public Tariff getTariff() {
        return tariff;
    }

    public void setTariff(Tariff tariff) {
        this.tariff = tariff;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Contract() {
    }

    public Contract(String number, Tariff tariff, Client client, Set<Option> options) {
        this.number = number;
        this.tariff = tariff;
        this.client = client;
        this.options = options;
    }
}
