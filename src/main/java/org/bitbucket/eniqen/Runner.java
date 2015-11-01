package org.bitbucket.eniqen;

import org.bitbucket.eniqen.model.Client;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.Date;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 */
public class Runner {
    public static void main(String[] args) {
        EntityManager entityManager = Persistence.createEntityManagerFactory("ISFMO").createEntityManager();
        entityManager.getTransaction().begin();

        Client client = new Client("Вася", "Батарейкин", new Date(), 1234567487L, "Карла-Маркса","test@bk.ru","123123");
        entityManager.persist(client);
        entityManager.getTransaction().commit();
        entityManager.close();
    }
}


