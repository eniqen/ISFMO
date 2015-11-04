package org.bitbucket.eniqen.model;

import javax.persistence.*;
import java.io.Serializable;
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
public class Tariff implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID", unique = true, nullable = false)
    private Integer id;
    @Column(name = "TITLE", length = 100, nullable = false)
    private String title;
    @Column(name = "PRICE", nullable = false)
    private Double price;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "TARIFF_OPTION_TBL",
            joinColumns = @JoinColumn(name = "TARIFF_ID"),
            inverseJoinColumns = @JoinColumn(name = "OPTION_ID"))
    private Set<Option> options;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Tariff(String title, Double price, Set<Option> options) {
        this.title = title;
        this.price = price;
        this.options = options;
    }

    public Tariff() {
    }
}