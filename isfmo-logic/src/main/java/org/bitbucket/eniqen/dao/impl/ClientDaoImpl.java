package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.ClientDao;
import org.bitbucket.eniqen.model.Client;

import javax.persistence.EntityManager;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */
public class ClientDaoImpl implements ClientDao {

    private EntityManager entityManager;

    public ClientDaoImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Client> getAll() {
        return this.entityManager.createNamedQuery("Client.getAll").getResultList();
    }

    @Override
    public Client getById(Long id) {
        return this.entityManager.find(Client.class, id);
    }

    @Override
    public void add(Client model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.persist(model);
        this.entityManager.getTransaction().commit();
    }

    @Override
    public void delete(Client model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.remove(model);
        this.entityManager.getTransaction().commit();
    }

    @Override
    public void update(Client model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.merge(model);
        this.entityManager.getTransaction().commit();
    }
}
