package org.bitbucket.eniqen;

import org.bitbucket.eniqen.controller.PersistenceContext;
import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.RoleType;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import java.util.Date;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 */
public class Runner {
    public static void main(String[] args) {
//        EntityManager entityManager = Persistence.createEntityManagerFactory("ISFMO").createEntityManager();
//
//        Client client = new Client("Вася", "Батарейкин", new Date(), "1234567487", "Карла-Маркса", "test@bk.ru", "123123", RoleType.USER, false, false);
//        Client client1 = new Client("Вова", "Телогрейкин", new Date(), "3211234141", "Пушкина", "test2@bk.ru", "321321", RoleType.USER, false, false);
//        Client client2 = new Client("Света", "Булкина", new Date(), "11133322233", "Гоголя", "test3@bk.ru", "333111", RoleType.USER, false, false);
//        List<Client> clientList = new ClientDaoImpl(entityManager).getAll();
//        for (Client client : clientList) {
//            System.out.println(client);
//        }
//        ClientServiceImpl clientService = new ClientServiceImpl();
//        clientService.addClient(client);
//        entityManager.getTransaction().begin();
//        entityManager.persist(client1);
//        entityManager.persist(client2);
//        entityManager.persist(client);
//        entityManager.getTransaction().commit();
//        entityManager.close();
//        ClientDaoImpl client = new ClientDaoImpl(entityManager);
//        Client client1 = client.getById(4L);
//        System.out.println(client1.toString());
    }
}


