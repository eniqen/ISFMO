package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.dao.ContractDAO;
import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;
import org.bitbucket.eniqen.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

/**
 * Created by Mikhail on 23.12.2015.
 */
@Service
public class ContractServiceImpl implements ContractService {

    @Autowired
    private ContractDAO contractDAO;

    @Override
    public Contract getById(Long id) {
        return this.contractDAO.getById(id);
    }

    @Override
    @Transactional
    public void delete(Contract model) {
        this.contractDAO.delete(model);
    }

    @Override
    @Transactional
    public void save(Contract model) {
        this.contractDAO.save(model);
    }

    @Override
    public List<Contract> getAll() {
        return this.contractDAO.getAll();
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        Contract contract = this.contractDAO.getById(id);
        this.contractDAO.delete(contract);
    }

    @Override
    public List<Contract> findClientContracts(Client client) {
        return this.contractDAO.findClientContracts(client);
    }
}
