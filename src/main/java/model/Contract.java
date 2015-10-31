package model;

import javax.persistence.Entity;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Сущность для работы с Контрактами
 *
 * @version 1.0
 */

@Entity
public class Contract extends BaseModel {

    private Tariff tariff;
    private List<Option> optionList;

    public Tariff getTariff() {
        return tariff;
    }

    public void setTariff(Tariff tariff) {
        this.tariff = tariff;
    }

    public List<Option> getOptionList() {
        return optionList;
    }

    public void setOptionList(List<Option> optionList) {
        this.optionList = optionList;
    }

    public Contract() {
    }

    public Contract(Tariff tariff, List<Option> optionList) {
        this.tariff = tariff;
        this.optionList = optionList;
    }
}
