package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.ClientDAO;
import org.bitbucket.eniqen.model.Client;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Repository
public class ClientDAOImpl implements ClientDAO {

    @PersistenceContext
    public EntityManager entityManager;

    public ClientDAOImpl() {
    }

    @Override
    public List<Client> getAll() {
        return this.entityManager.createNamedQuery("Client.getAll").getResultList();
    }

    @Override
    public Client getById(Long id) {
        return this.entityManager.find(Client.class, id);
    }

    @Transactional
    @Override
    public void add(Client model) {
        this.entityManager.persist(model);
    }

    @Transactional
    @Override
    public void delete(Client model) {
        this.entityManager.remove(model);
    }

    @Transactional
    @Override
    public void update(Client model) {
        this.entityManager.merge(model);
    }

    @Override
    public Client findClientByNumber(String phoneNumber) {
        Query query = this.entityManager.createQuery("select c from Client c inner join Contract con where con" +
                ".phoneNumber =:phoneNumber");
        return (Client) query.setParameter("phoneNumber", phoneNumber).getSingleResult();
    }

    @Override
    public Client findByEmail(String email) {
        Query query = this.entityManager.createQuery("select c from Client c where c.email =:email");
        return (Client) query.setParameter("email", email).getSingleResult();
    }
}
