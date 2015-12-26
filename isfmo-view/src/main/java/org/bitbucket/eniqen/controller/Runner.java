package org.bitbucket.eniqen.controller;

import org.bitbucket.eniqen.dao.*;
import org.bitbucket.eniqen.dao.impl.*;
import org.bitbucket.eniqen.model.*;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import java.util.Date;

/**
 * Created by Mikhail on 29.11.2015.
 */
public class Runner {

    public static void main(String[] args) {
        EntityManager entityManager = Persistence.createEntityManagerFactory("ISFMO").createEntityManager();

        //Номера
        PhoneNumberDAO phoneNumber = new PhoneNumberDAOImpl(entityManager);
        for (long i = 79999999990L; i < 80000000000L; i++) {
            entityManager.getTransaction().begin();
            phoneNumber.add(new PhoneNumber(String.valueOf(i)));
            entityManager.getTransaction().commit();
        }

        //Клиенты
        ClientDAO clientDAO = new ClientDAOImpl(entityManager);
        entityManager.getTransaction().begin();
        clientDAO.add(new Client("Василий", "Петров", new Date(), "0809 123344", "Пушкина 15", "volosat@mail.ru", "123"));
        clientDAO.add(new Client("Петр", "Смирнов", new Date(), "0809 442311", "Жуковского 33", "malovat@mail.ru", "123"));
        clientDAO.add(new Client("Валентина", "Защекина", new Date(), "0809 123456", "Смирнова 105", "gipokrat@mail.ru", "123"));
        clientDAO.add(new Client("Степан", "Борисов", new Date(), "0809 338834", "Зайцева 32", "kotopes@mail.ru", "123"));
        clientDAO.add(new Client("Кирилл", "Иванов", new Date(), "0809 128543", "Гоголя 3", "kotomes@mail.ru", "123"));
        clientDAO.add(new Client("Мария", "Магдалена", new Date(), "0809 568734", "Плюшкина 5", "farsh@mail.ru", "123"));
        clientDAO.add(new Client("Светлана", "Потапова", new Date(), "0809 667732", "Карла-Маркса 1", "pivo@mail.ru", "123"));
        clientDAO.add(new Client("Борис", "Негодует", new Date(), "0809 993456", "Зимовка 115", "bulka@mail.ru", "123"));
        clientDAO.add(new Client("Иван", "Неиван", new Date(), "0809 234856", "Кролики 152", "salatik@mail.ru", "123"));
        clientDAO.add(new Client("Гоген", "Солнцев", new Date(), "0809 567994", "Флегонтова 2", "volprivetosat@mail.ru", "123"));
        entityManager.getTransaction().commit();

        //Опции
        OptionDAO optionDAO = new OptionDAOImpl(entityManager);
        entityManager.getTransaction().begin();
        optionDAO.add(new Option("50 смс", 50.0, 10.0));
        optionDAO.add(new Option("100 смс", 100.0, 10.0));
        optionDAO.add(new Option("200 смс", 150.0, 10.0));
        optionDAO.add(new Option("300 смс", 200.0, 10.0));
        optionDAO.add(new Option("500 смс", 300.0, 50.0));
        optionDAO.add(new Option("Пакет 10 минут в подарок", 10.0, 50.0));
        optionDAO.add(new Option("Пакет 20 минут в подарок", 10.0, 50.0));
        optionDAO.add(new Option("Пакет 30 минут в подарок", 10.0, 100.0));
        optionDAO.add(new Option("Пакет 50 минут в подарок", 10.0, 150.0));
        optionDAO.add(new Option("Пакет 100 минут в подарок", 50.0, 15.0));
        optionDAO.add(new Option("Интернет S", 200.0, 50.0));
        optionDAO.add(new Option("Интернет M", 300.0, 50.0));
        optionDAO.add(new Option("Интернет L", 500.0, 50.0));
        optionDAO.add(new Option("Интернет XL", 700.0, 50.0));
        optionDAO.add(new Option("Интернет XXL", 1000.0, 50.0));
        optionDAO.add(new Option("Везде как дома", 500.0, 50.0));
        optionDAO.add(new Option("Звонки за границу Азия", 200.0, 50.0));
        optionDAO.add(new Option("Звонки за границу Европа", 200.0, 50.0));
        optionDAO.add(new Option("Звонки за границу ЮВА", 200.0, 50.0));
        optionDAO.add(new Option("Обещанный платеж 50", 0.0, 50.0));
        optionDAO.add(new Option("Обещанный платеж 100", 0.0, 50.0));
        optionDAO.add(new Option("Обещанный платеж 150", 0.0, 50.0));
        optionDAO.add(new Option("Обещанный платеж 200", 0.0, 50.0));
        optionDAO.add(new Option("Обещанный платеж 300", 0.0, 50.0));
        optionDAO.add(new Option("Обещанный платеж 500", 0.0, 50.0));
        entityManager.getTransaction().commit();

//        //Роли
        RoleDAO roleDAO = new RoleDAOImpl(entityManager);
        entityManager.getTransaction().begin();
        roleDAO.add(new Role(RoleType.ADMIN));
        roleDAO.add(new Role(RoleType.OPERATOR));
        roleDAO.add(new Role(RoleType.USER));
        entityManager.getTransaction().commit();

        //Тарифы
        TariffDAO tariffDAO = new TariffDAOImpl(entityManager);
        entityManager.getTransaction().begin();
        tariffDAO.add(new Tariff("Все включено S", 300.0));
        tariffDAO.add(new Tariff("Все включено M", 400.0));
        tariffDAO.add(new Tariff("Все включено L", 500.0));
        tariffDAO.add(new Tariff("Все включено XL", 700.0));
        tariffDAO.add(new Tariff("Все включено VIP", 1000.0));
        tariffDAO.add(new Tariff("Все Просто", 200.0));
        tariffDAO.add(new Tariff("Переходи на 0", 250.0));
        tariffDAO.add(new Tariff("Теплый прием", 400.0));
        entityManager.getTransaction().commit();
    }
}
