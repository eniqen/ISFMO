package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.dao.ClientDAO;
import org.bitbucket.eniqen.exception.ExceptionUtil;
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
    public List<Contract> findAllContracts(Client model) {
        return null;
    }

    @Override
    public Client findByEmail(String email) {
        return ExceptionUtil.check(this.clientDAO.findByEmail(email), "email=" + email);
    }

    @Override
    public Client findByNumber(String number) {
        return ExceptionUtil.check(this.clientDAO.findByNumber(number), "number=" + number);
    }

    @Override
    public Client getById(Long id) {
        return ExceptionUtil.check(this.clientDAO.getById(id), id);
    }

    @Override
    @Transactional
    public void delete(Client model) {
        this.clientDAO.delete(model);
    }

    @Override
    @Transactional
    public void save(Client model) {
        ExceptionUtil.check(this.clientDAO.save(model), model.toString());
    }

    @Override
    public List<Client> getAll() {
        return clientDAO.getAll();
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        Client client = this.clientDAO.getById(id);
        this.clientDAO.delete(client);
    }
}
