package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.ContractDao;
import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import javax.persistence.EntityManager;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 04.11.2015.
 */
public class ContractDaoImpl implements ContractDao {
    private EntityManager entityManager;

    public ContractDaoImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Contract> getAll() {
        return this.entityManager.createNamedQuery("Contract.getAll").getResultList();
    }

    @Override
    public Contract getById(Integer id) {
        return this.entityManager.find(Contract.class, id);
    }

    @Override
    public void add(Contract model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.persist(model);
        this.entityManager.getTransaction().commit();
    }

    @Override
    public void delete(Contract model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.remove(model);
        this.entityManager.getTransaction().commit();
    }

    @Override
    public void update(Contract model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.merge(model);
        this.entityManager.getTransaction().commit();
    }
}
