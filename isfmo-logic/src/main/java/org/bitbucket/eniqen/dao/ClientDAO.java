package org.bitbucket.eniqen.dao;

import org.bitbucket.eniqen.model.Client;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Дао класс для работы с сущностью Клиент
 */

public interface ClientDAO extends BaseDAO<Client> {

    Client findByNumber(String number);

    Client findByEmail(String email);
}
