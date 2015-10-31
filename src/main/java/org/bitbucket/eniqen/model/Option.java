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
public class Option implements Serializable {
    @Id
    @Column(name = "ID")
    private Integer id;
    @Column(name = "TITLE")
    private String title;
    @Column(name = "PRICE")
    private Double price;
    @Column(name = "CONNECTION_PRICE")
    private Double connectionPrice;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "INCOMPATIBLE_OPTIONS_TBL",
            joinColumns = @JoinColumn(name = "OPTION_TBL_ID"),
            inverseJoinColumns = @JoinColumn(name = "OPTION_TBL_ID1"))
    private Set<Option> incompatibleOptions;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "COMPATIBLE_OPTIONS_TBL",
            joinColumns = @JoinColumn(name = "OPTION_TBL_ID"),
            inverseJoinColumns = @JoinColumn(name = "OPTION_TBL_ID1"))
    private Set<Option> compatibleOptions;


    public Set<Option> getIncompatibleOptions() {
        return incompatibleOptions;
    }

    public void setIncompatibleOptions(Set<Option> incompatibleOptions) {
        this.incompatibleOptions = incompatibleOptions;
    }

    public Set<Option> getCompatibleOptions() {
        return compatibleOptions;
    }

    public void setCompatibleOptions(Set<Option> compatibleOptions) {
        this.compatibleOptions = compatibleOptions;
    }

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

    public Double getConnectionPrice() {
        return connectionPrice;
    }

    public void setConnectionPrice(Double connectionPrice) {
        this.connectionPrice = connectionPrice;
    }

    public Option() {
    }

}
