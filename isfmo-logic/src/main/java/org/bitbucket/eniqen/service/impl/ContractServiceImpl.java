package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.dao.ContractDAO;
import org.bitbucket.eniqen.model.Contract;
import org.bitbucket.eniqen.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Mikhail on 23.12.2015.
 */
@Service
@Transactional(readOnly = true)
public class ContractServiceImpl implements ContractService {

    @Autowired
    private ContractDAO contractDAO;

    @Override
    public Contract getById(Long id) {
        return this.contractDAO.getById(id);
    }

    @Override
    public void add(Contract model) {
        this.contractDAO.add(model);
    }

    @Override
    public void delete(Contract model) {
        this.contractDAO.delete(model);
    }

    @Override
    public void update(Contract model) {
        this.contractDAO.update(model);
    }

    @Override
    public List<Contract> getAll() {
        return this.contractDAO.getAll();
    }

    @Override
    public void deleteById(Long id) {
        Contract contract = this.contractDAO.getById(id);
        this.contractDAO.delete(contract);
    }
}
