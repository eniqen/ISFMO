package org.bitbucket.eniqen.service;

import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 14.11.2015.
 */
public interface OperatorService {
    Client addClient(Client client);

    void delete(Client client);

    Client findByName(String name);

    Client editClient(Client client);

    List<Client> findAll();

    List<Contract> findAllContractsByClient(Client client);
}
