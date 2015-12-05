package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.dao.ClientDAO;
import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;
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
    private ClientDAO clientDAO;

    @Override
    public List<Contract> findAllContractsByClient(Client client) {
        return null;
    }

    @Override
    public List<Client> getAll() {
        return clientDAO.getAll();
    }
}
