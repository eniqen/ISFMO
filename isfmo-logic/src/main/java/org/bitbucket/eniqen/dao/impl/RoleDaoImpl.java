package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.RoleDao;
import org.bitbucket.eniqen.model.Role;

import javax.persistence.EntityManager;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 04.11.2015.
 */
public class RoleDaoImpl implements RoleDao {
    private EntityManager entityManager;

    public RoleDaoImpl(EntityManager entityManager) {
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

    @Override
    public void add(Role model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.persist(model);
        this.entityManager.getTransaction().commit();
    }

    @Override
    public void delete(Role model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.remove(model);
        this.entityManager.getTransaction().commit();
    }

    @Override
    public void update(Role model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.merge(model);
        this.entityManager.getTransaction().commit();
    }
}
