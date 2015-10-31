package dao;

import model.Client;
import model.Contract;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Дао класс для работы с сущностью Контракт
 */

public interface ContractDao extends BaseDao<Contract> {
    Contract findByNumber(String number);
    Client findUserByNumber(String number);
}
