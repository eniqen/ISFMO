package org.bitbucket.eniqen.service;

import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

public interface ClientService {

    Client editClient(Client client);

    List<Contract> findAllContractsByClient(Client client);
}
