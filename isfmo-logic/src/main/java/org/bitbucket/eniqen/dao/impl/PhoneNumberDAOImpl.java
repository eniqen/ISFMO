package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.PhoneNumberDao;
import org.bitbucket.eniqen.model.PhoneNumber;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import java.util.List;

/**
 * Created by Mikhail on 29.11.2015.
 */
@Repository
public class PhoneNumberDaoImpl implements PhoneNumberDao {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager entityManager;


//    public PhoneNumberDaoImpl(EntityManager entityManager) {
//        this.entityManager = entityManager;
//    }

    public PhoneNumberDaoImpl() {
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
    public void delete(PhoneNumber model) {
        entityManager.remove(model);
    }

    @Override
    public PhoneNumber save(PhoneNumber model) {
       return this.entityManager.merge(model);
    }
}
