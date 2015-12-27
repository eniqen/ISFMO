package org.bitbucket.eniqen.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Сущность для работы с Тарифами
 *
 * @version 1.0
 */
@Entity
@Table(name = "TARIFF_TBL")
@NamedQuery(name = "Tariff.getAll", query = "SELECT t FROM Tariff t")
public class Tariff extends BaseEntity {

    @Column(name = "TITLE", length = 100, nullable = false)
    private String title;

    @Column(name = "PRICE", nullable = false)
    private Double price;

    @JsonIgnore
    @ManyToMany
    @JoinTable(name = "TARIFF_OPTION_TBL",
            joinColumns = @JoinColumn(name = "tariff_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "option_id", referencedColumnName = "id"))
    private Set<Option> options;

    public Tariff(String title, Double price, Set<Option> options) {
        this.title = title;
        this.price = price;
        this.options = options;
    }

    public Tariff(String title, Double price) {
        this.title = title;
        this.price = price;
    }

    public Tariff() {
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

    public Set<Option> getOptions() {
        return options;
    }

    public void setOptions(Set<Option> options) {
        this.options = options;
    }

    @Override
    public String toString() {
        return "Tariff{" +
                "title='" + title + '\'' +
                ", price=" + price +
                ", options=" + options +
                '}';
    }
}
