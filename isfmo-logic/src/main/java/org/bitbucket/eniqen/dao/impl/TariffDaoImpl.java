package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.TariffDAO;
import org.bitbucket.eniqen.model.Tariff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 04.11.2015.
 */

@Repository
public class TariffDAOImpl implements TariffDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public TariffDAOImpl() {
    }

    public TariffDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Tariff> getAll() {
        return entityManager.createNamedQuery("Tariff.getAll").getResultList();
    }

    @Override
    public Tariff getById(Long id) {
        return this.entityManager.find(Tariff.class, id);
    }

    @Transactional
    @Override
    public void add(Tariff model) {
        this.entityManager.persist(model);
    }

    @Transactional
    @Override
    public void delete(Tariff model) {
        this.entityManager.remove(model);
    }

    @Transactional
    @Override
    public void update(Tariff model) {
        this.entityManager.merge(model);
    }
}
