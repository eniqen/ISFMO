package org.bitbucket.eniqen.model;

import javax.persistence.*;
import java.io.Serializable;
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

    @Column(name = "TITLE", length = 100, nullable = false)
    private String title;

    @Column(name = "PRICE", nullable = false)
    private Double price;

    @Column(name = "CONNECTION_PRICE", nullable = false)
    private Double connectionPrice;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "COMPATIBLE_OPTIONS_TBL",
            joinColumns = @JoinColumn(name = "OPTION_ID"),
            inverseJoinColumns = @JoinColumn(name = "OPTION_ID1"))
    private Set<Option> compatibleOptions;


    //todo посмотреть
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "options")
    private Set<Contract> contracts;

    public Option() {
    }

    public Option(String title, Double price, Double connectionPrice) {
        this.title = title;
        this.price = price;
        this.connectionPrice = connectionPrice;
    }

    public Option(String title, Double price, Double connectionPrice, Set<Option> compatibleOptions, Set<Contract> contracts) {
        this.title = title;
        this.price = price;
        this.connectionPrice = connectionPrice;
        this.compatibleOptions = compatibleOptions;
        this.contracts = contracts;
    }

    public Set<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(Set<Contract> contracts) {
        this.contracts = contracts;
    }

    public Set<Option> getCompatibleOptions() {
        return compatibleOptions;
    }

    public void setCompatibleOptions(Set<Option> compatibleOptions) {
        this.compatibleOptions = compatibleOptions;
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

    @Override
    public String toString() {
        return "Option{" +
                "title='" + title + '\'' +
                ", price=" + price +
                ", connectionPrice=" + connectionPrice +
                ", compatibleOptions=" + compatibleOptions +
                ", contracts=" + contracts +
                '}';
    }
}
