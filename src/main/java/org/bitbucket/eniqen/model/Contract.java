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
    @Column(name = "ID")
    private Integer id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinTable(name = "TARIFF_TBL", joinColumns = @JoinColumn(name = "ID"), inverseJoinColumns = @JoinColumn(name = "ID"))
    private Tariff tariff;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinTable(name = "CLIENT_TBL", joinColumns = @JoinColumn(name = "ID"), inverseJoinColumns = @JoinColumn(name = "ID"))
    private Client client;

    @ManyToMany
    @JoinTable(
            name = "CONTRACT_TBL_has_OPTION_TBL",
            joinColumns = {@JoinColumn(name = "CONTRACT_TBL_ID", referencedColumnName = "ID")},
            inverseJoinColumns = {@JoinColumn(name = "OPTION_TBL_ID", referencedColumnName = "ID")})
    private Set<Option> options;

    public Set<Option> getOptions() {
        return options;
    }

    public Client getClient() {
        return client;
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

    public Contract(Integer id, Tariff tariff) {
        this.id = id;
        this.tariff = tariff;
    }
}
