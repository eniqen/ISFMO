package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.TariffDao;
import org.bitbucket.eniqen.model.Tariff;

import javax.persistence.EntityManager;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 04.11.2015.
 */
public class TariffDaoImpl implements TariffDao {
    private EntityManager entityManager;

    public TariffDaoImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Tariff> getAll() {
        return entityManager.createNamedQuery("Tariff.getAll").getResultList();
    }

    @Override
    public Tariff getById(Integer id) {
        return this.entityManager.find(Tariff.class, id);
    }

    @Override
    public void add(Tariff model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.persist(model);
        this.entityManager.getTransaction().commit();
    }

    @Override
    public void delete(Tariff model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.remove(model);
        this.entityManager.getTransaction().commit();
    }

    @Override
    public void update(Tariff model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.merge(model);
        this.entityManager.getTransaction().commit();
    }
}
