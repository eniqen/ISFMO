package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.ClientDAO;
import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.User;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Repository
public class ClientDAOImpl implements ClientDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    public EntityManager entityManager;

    public ClientDAOImpl() {
    }

//    public ClientDAOImpl(EntityManager entityManager) {
//        this.entityManager = entityManager;
//    }

    @Override
    public List<Client> getAll() {
        return this.entityManager.createNamedQuery("Client.getAll").getResultList();
    }

    @Override
    public Client getById(Long id) {
        return this.entityManager.find(Client.class, id);
    }

    @Override
    public void delete(Client model) {
        this.entityManager.remove(model);
    }

    @Override
    public Client save(Client model) {
       return this.entityManager.merge(model);
    }

    @Override
    public Client findByNumber(String phoneNumber) {
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
