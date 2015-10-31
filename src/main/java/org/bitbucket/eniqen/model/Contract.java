package org.bitbucket.eniqen.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Сущность для работы с Контрактами
 *
 * @version 1.0
 */

@Entity
public class Contract implements Serializable {

    @Id
    private Integer id;

    private Tariff tariff;

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
