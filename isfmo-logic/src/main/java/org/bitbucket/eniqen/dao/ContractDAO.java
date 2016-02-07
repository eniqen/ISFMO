package org.bitbucket.eniqen.dao;


import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Дао класс для работы с сущностью Контракт
 */

public interface ContractDAO extends BaseDAO<Contract> {

    List<Contract> findClientContracts (Client client);
}
