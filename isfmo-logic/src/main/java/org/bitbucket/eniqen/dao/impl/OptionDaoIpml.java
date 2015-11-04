package org.bitbucket.eniqen.dao.impl;

import org.bitbucket.eniqen.dao.OptionDao;
import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Option;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import javax.persistence.EntityManager;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 04.11.2015.
 */
public class OptionDaoIpml implements OptionDao {
    private EntityManager entityManager;

    public OptionDaoIpml(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Option> getAll() {
        return this.entityManager.createNamedQuery("Option.getAll").getResultList();
    }

    @Override
    public Option getById(Integer id) {
        return this.entityManager.find(Option.class, id);
    }

    @Override
    public void add(Option model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.persist(model);
        this.entityManager.getTransaction().commit();
    }

    @Override
    public void delete(Option model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.remove(model);
        this.entityManager.getTransaction().commit();
    }

    @Override
    public void update(Option model) {
        this.entityManager.getTransaction().begin();
        this.entityManager.merge(model);
        this.entityManager.getTransaction().commit();
    }
}
