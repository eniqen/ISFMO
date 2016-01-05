package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.OptionDAO;
import org.bitbucket.eniqen.model.Option;
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
public class OptionDAOImpl implements OptionDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
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
    public void save(Option model) {
        this.entityManager.merge(model);
    }
}
