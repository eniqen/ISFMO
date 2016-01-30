package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.UserRoleDao;
import org.bitbucket.eniqen.model.UserRole;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 04.11.2015.
 */

@Repository
public class RoleDAOImpl implements UserRoleDao {

    @PersistenceContext
    private EntityManager entityManager;

    public RoleDAOImpl() {
    }

//    public RoleDAOImpl(EntityManager entityManager) {
//        this.entityManager = entityManager;
//    }

    @Override
    public List<UserRole> getAll() {
        return this.entityManager.createNamedQuery("Role.getAll").getResultList();
    }

    @Override
    public UserRole getById(Long id) {
        return this.entityManager.find(UserRole.class, id);
    }

    @Override
    public void delete(UserRole model) {
        this.entityManager.remove(model);
    }

    @Override
    public UserRole save(UserRole model) {
        return this.entityManager.merge(model);
    }
}
