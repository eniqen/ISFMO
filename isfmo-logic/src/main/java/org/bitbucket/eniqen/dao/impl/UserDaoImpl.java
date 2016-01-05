package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.UserDao;
import org.bitbucket.eniqen.model.User;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import java.util.List;

/**
 * Created by Mikhail on 05.01.2016.
 */

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager entityManager;

    @Override
    public List<User> getAll() {
        return entityManager.createNamedQuery("User.getAll").getResultList();
    }

    @Override
    public User getById(Long id) {
        return this.entityManager.find(User.class, id);
    }

    @Override
    public void delete(User model) {
        this.entityManager.remove(model);
    }

    @Override
    public void save(User model) {
        entityManager.merge(model);
    }

    @Override
    public User findUserByUsername(String username) {
        return (User)entityManager.createNamedQuery("findUserByUsername").setParameter(1, username).getSingleResult();
    }
}
