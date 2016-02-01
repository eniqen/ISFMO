package org.bitbucket.eniqen.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Сущность для работы с Опциями
 *
 * @version 1.0
 */
@Entity
@Table(name = "OPTION_TBL")
@NamedQuery(name = "Option.getAll", query = "SELECT o FROM Option o")
public class Option extends BaseEntity {

    @Size(min = 5, max = 100)
    @Column(name = "TITLE", length = 100, nullable = false)
    private String title;

    @Digits(integer = 6, fraction = 2)
    @NotNull
    @Column(name = "PRICE", nullable = false)
    private Double price;

    @Digits(integer = 6, fraction = 2)
    @NotNull
    @Column(name = "CONNECTION_PRICE", nullable = false)
    private Double connectionPrice;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "COMPATIBLE_OPTIONS_TBL",
            joinColumns = @JoinColumn(name = "OPTION_ID"),
            inverseJoinColumns = @JoinColumn(name = "OPTION_ID1"))
    private Set<Option> compatibleOptions;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "options")
    private Set<Tariff> tariffs;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "options")
    private Set<Contract> contracts;

    public Option() {
    }

    public Set<Tariff> getTariffs() {
        return tariffs;
    }

    public void setTariffs(Set<Tariff> tariffs) {
        this.tariffs = tariffs;
    }

    public Set<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(Set<Contract> contracts) {
        this.contracts = contracts;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String name) {
        this.title = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getConnectionPrice() {
        return connectionPrice;
    }

    public void setConnectionPrice(Double connectionPrice) {
        this.connectionPrice = connectionPrice;
    }

    public Set<Option> getCompatibleOptions() {
        return compatibleOptions;
    }

    public void setCompatibleOptions(Set<Option> compatibleOptions) {
        this.compatibleOptions = compatibleOptions;
    }

    public Option(String title, Double price, Double connectionPrice, Set<Option> compatibleOptions, Set<Tariff> tariffs, Set<Contract> contracts) {
        this.title = title;
        this.price = price;
        this.connectionPrice = connectionPrice;
        this.compatibleOptions = compatibleOptions;
        this.tariffs = tariffs;
        this.contracts = contracts;
    }

    public Option(String title, Double price, Double connectionPrice) {
        this.title = title;
        this.price = price;
        this.connectionPrice = connectionPrice;
    }
}
