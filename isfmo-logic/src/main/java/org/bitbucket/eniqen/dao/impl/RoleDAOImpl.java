package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.RoleDAO;
import org.bitbucket.eniqen.model.Role;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 04.11.2015.
 */

@Repository
public class RoleDAOImpl implements RoleDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager entityManager;

    public RoleDAOImpl() {
    }

//    public RoleDAOImpl(EntityManager entityManager) {
//        this.entityManager = entityManager;
//    }

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
        this.entityManager.persist(model);
    }

    @Override
    public void delete(Role model) {
        this.entityManager.remove(model);
    }

    @Override
    public void update(Role model) {
        this.entityManager.merge(model);
    }
}
