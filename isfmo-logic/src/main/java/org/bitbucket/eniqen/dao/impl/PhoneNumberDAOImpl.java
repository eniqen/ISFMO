package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.PhoneNumberDAO;
import org.bitbucket.eniqen.model.PhoneNumber;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import java.util.List;

/**
 * Created by Mikhail on 29.11.2015.
 */
@Repository
public class PhoneNumberDAOImpl implements PhoneNumberDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager entityManager;


//    public PhoneNumberDAOImpl(EntityManager entityManager) {
//        this.entityManager = entityManager;
//    }

    public PhoneNumberDAOImpl() {
    }

    @Override
    public List<PhoneNumber> getAll() {
        return entityManager.createNamedQuery("PhoneNumber.getAll").getResultList();
    }

    @Override
    public PhoneNumber getById(Long id) {
        return this.entityManager.find(PhoneNumber.class, id);
    }

    @Override
    public void add(PhoneNumber model) {
        entityManager.persist(model);
    }

    @Override
    public void delete(PhoneNumber model) {
        entityManager.detach(model);
    }

    @Override
    public void update(PhoneNumber model) {
        entityManager.merge(model);
    }
}
