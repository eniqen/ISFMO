package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.RoleDao;
import org.bitbucket.eniqen.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 04.11.2015.
 */

@Repository
public class RoleDAOImpl implements RoleDao {

    @Autowired
    private EntityManager entityManager;

    public RoleDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Role> getAll() {
        return this.entityManager.createNamedQuery("Role.getAll").getResultList();
    }

    @Override
    public Role getById(Long id) {
        return this.entityManager.find(Role.class, id);
    }

    @Transactional
    @Override
    public void add(Role model) {
        this.entityManager.persist(model);
    }

    @Transactional
    @Override
    public void delete(Role model) {
        this.entityManager.remove(model);
    }

    @Transactional
    @Override
    public void update(Role model) {
        this.entityManager.merge(model);
    }
}
