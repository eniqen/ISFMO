package org.bitbucket.eniqen.service;

import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

public interface ClientService extends BaseService<Client>{

    List<Contract> findAllContracts(Client model);

    Client findByEmail(String email);

    Client findByNumber(String number);
}
