package org.bitbucket.eniqen.model;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Сущность для работы с Тарифами
 *
 * @version 1.0
 */

public class Tariff implements Serializable {
    private String name;
    private Double price;
    private List<Option> options;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public List<Option> getOptions() {
        return options;
    }

    public void setOptions(List<Option> options) {
        this.options = options;
    }

    public Tariff(String name, Double price, List<Option> options) {
        this.name = name;
        this.price = price;
        this.options = options;
    }

    public Tariff() {
    }
}
