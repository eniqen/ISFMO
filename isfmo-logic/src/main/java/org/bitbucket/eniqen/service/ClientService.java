package org.bitbucket.eniqen.service;

import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

public interface ClientService {

    List<Contract> findAllContractsByClient(Client client);

    List<Client> getAll();

    Client getById(Long id);

    void add(Client model);

    void delete(Client model);

    void update(Client model);

    void deleteById(Long id);
}
