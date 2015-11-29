package org.bitbucket.eniqen.controller;

import org.bitbucket.eniqen.dao.impl.ClientDAOImpl;
import org.bitbucket.eniqen.model.Client;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */
@WebServlet(name = "FirstServlet", urlPatterns = {"/cabinet"})
public class FirstServlet extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        emf = Persistence.createEntityManagerFactory("ISFMO");
        EntityManager entityManager = emf.createEntityManager();
        List<Client> clientList = new ClientDAOImpl(entityManager).getAll();
        req.setAttribute("employees", clientList);
        req.getRequestDispatcher("/WEB-INF/view/employees.jsp").forward(req, resp);
    }
}
