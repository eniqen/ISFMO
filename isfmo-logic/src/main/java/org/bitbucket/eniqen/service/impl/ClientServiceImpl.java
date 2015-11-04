package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.repository.ClientRepository;
import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientRepository clientRepository;

    @Override
    public Client addClient(Client client) {
        Client newClient = clientRepository.saveAndFlush(client);
        return newClient;
    }

    @Override
    public void delete(int id) {
        clientRepository.delete(id);
    }

    @Override
    public Client findByName(String name) {
        return clientRepository.findByName(name);
    }

    @Override
    public Client editClient(Client client) {
        return clientRepository.saveAndFlush(client);
    }

    @Override
    public List<Client> findAll() {
        return clientRepository.findAll();
    }
}
