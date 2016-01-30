package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.OptionDAO;
import org.bitbucket.eniqen.model.Option;
import org.springframework.stereotype.Repository;

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

//    public OptionDAOImpl(EntityManager entityManager) {
//        this.entityManager = entityManager;
//    }

    @Override
    public List<Option> getAll() {
        return this.entityManager.createNamedQuery("Option.getAll").getResultList();
    }

    @Override
    public Option getById(Long id) {
        return this.entityManager.find(Option.class, id);
    }

    @Override
    public void delete(Option model) {
        this.entityManager.remove(model);
    }


    @Override
    public Option save(Option model) {
       return this.entityManager.merge(model);
    }
}
