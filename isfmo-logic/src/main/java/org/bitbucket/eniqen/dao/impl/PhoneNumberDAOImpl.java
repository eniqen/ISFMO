package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.PhoneNumberDAO;
import org.bitbucket.eniqen.model.PhoneNumber;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

/**
 * Created by Mikhail on 29.11.2015.
 */
@Repository
public class PhoneNumberDAOImpl implements PhoneNumberDAO {

    @Autowired
    private EntityManager entityManager;

    public PhoneNumberDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

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

    @Transactional
    @Override
    public void add(PhoneNumber model) {
        entityManager.persist(model);
    }

    @Transactional
    @Override
    public void delete(PhoneNumber model) {
        entityManager.detach(model);
    }

    @Transactional
    @Override
    public void update(PhoneNumber model) {
        entityManager.merge(model);
    }
}
