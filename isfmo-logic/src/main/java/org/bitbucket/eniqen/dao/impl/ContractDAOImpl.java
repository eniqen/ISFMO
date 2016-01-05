package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.ContractDAO;
import org.bitbucket.eniqen.model.Contract;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 04.11.2015.
 */

@Repository
public class ContractDAOImpl implements ContractDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager entityManager;

    public ContractDAOImpl() {
    }

    @Override
    public List<Contract> getAll() {
        return this.entityManager.createNamedQuery("Contract.getAll").getResultList();
    }

    @Override
    public Contract getById(Long id) {
        return this.entityManager.find(Contract.class, id);
    }

    @Override
    public void delete(Contract model) {
        this.entityManager.remove(model);
    }

    @Override
    public void save(Contract model) {
        this.entityManager.merge(model);
    }

    @Override
    public Contract findContractByNumber(String number) {
        Query query = this.entityManager.createQuery("select c from Client c where c.number =:number");
        return (Contract) query.setParameter("number", number).getSingleResult();
    }
}
