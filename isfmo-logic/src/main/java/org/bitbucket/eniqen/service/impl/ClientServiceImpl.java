package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.dao.ClientDAO;
import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;
import org.bitbucket.eniqen.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientDAO clientDAO;

    @Override
    public List<Contract> findAllContractsByClient(Client client) {
        return null;
    }

    @Override
    public List<Client> getAll() {
        return clientDAO.getAll();
    }

    @Override
    public Client getById(Long id) {
        return this.clientDAO.getById(id);
    }

    @Transactional
    @Override
    public void add(Client model) {
        this.clientDAO.add(model);
    }

    @Transactional
    @Override
    public void delete(Client model) {
        this.clientDAO.delete(model);
    }

    @Transactional
    @Override
    public void update(Client model) {
        this.clientDAO.update(model);
    }

    @Transactional
    @Override
    public void deleteById(Long id) {
        Client client = this.clientDAO.getById(id);
        this.clientDAO.delete(client);
    }
}
