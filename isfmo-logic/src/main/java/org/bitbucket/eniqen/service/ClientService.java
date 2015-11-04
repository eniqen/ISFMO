package org.bitbucket.eniqen.service;

import org.bitbucket.eniqen.model.Client;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */
public interface ClientService {
    Client addClient(Client client);

    void delete(int id);

    Client findByName(String name);

    Client editClient(Client client);

    List<Client> findAll();
}
