package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.OptionDAO;
import org.bitbucket.eniqen.model.Option;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 04.11.2015.
 */

@Repository
public class OptionDAOImpl implements OptionDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public OptionDAOImpl() {
    }

    public OptionDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Option> getAll() {
        return this.entityManager.createNamedQuery("Option.getAll").getResultList();
    }

    @Override
    public Option getById(Long id) {
        return this.entityManager.find(Option.class, id);
    }

    @Transactional
    @Override
    public void add(Option model) {
        this.entityManager.persist(model);
    }

    @Transactional
    @Override
    public void delete(Option model) {
        this.entityManager.remove(model);
    }

    @Transactional
    @Override
    public void update(Option model) {
        this.entityManager.merge(model);
    }
}
