package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.dao.ClientDao;

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
        return entityManager.createNamedQuery("Client.getAll").getResultList();
    }

    @Override
    public Client getById(Long id) {
        return null;
    }

    @Override
    public void add(Client model) {

    }

    @Override
    public void delete(Client model) {

    }

    @Override
    public void update(Client model) {

    }
}
