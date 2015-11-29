package org.bitbucket.eniqen.controller;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

/**
 * Created by Mikhail on 29.11.2015.
 */
public class Runner {

    public static void main(String[] args) {
        EntityManager entityManager = Persistence.createEntityManagerFactory("ISFMO").createEntityManager();
//        ClientDAO clientDao = new ClientDAOImpl(entityManager);
//        List<Client> all = clientDao.getAll();
//        System.out.println(all);
//        System.out.println();
//        Client byEmail = clientDao.findByEmail("r2n@bk.ru");
//        System.out.println(byEmail);
    }
}
