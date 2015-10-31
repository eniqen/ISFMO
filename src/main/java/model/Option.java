package model;

import javax.persistence.Entity;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Сущность для работы с Опциями
 *
 * @version 1.0
 */

@Entity
public class Option extends BaseModel {
    private String name;
    private Double price;
    private Double connectionPrice;

    public Option(String name, Double price, Double connectionPrice) {
        this.name = name;
        this.price = price;
        this.connectionPrice = connectionPrice;
    }

    public Option() {
    }

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

    public Double getConnectionPrice() {
        return connectionPrice;
    }

    public void setConnectionPrice(Double connectionPrice) {
        this.connectionPrice = connectionPrice;
    }
}
