package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.TariffDAO;
import org.bitbucket.eniqen.model.Tariff;
import org.springframework.stereotype.Repository;

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

//    public TariffDAOImpl(EntityManager entityManager) {
//        this.entityManager = entityManager;
//    }

    @Override
    public List<Tariff> getAll() {
        return entityManager.createNamedQuery("Tariff.getAll").getResultList();
    }

    @Override
    public Tariff getById(Long id) {
        return this.entityManager.find(Tariff.class, id);
    }

    @Override
    public void delete(Tariff model) {
        this.entityManager.remove(model);
    }

    @Override
    public Tariff save(Tariff model) {
        return this.entityManager.merge(model);
    }
}
