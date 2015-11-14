package org.bitbucket.eniqen;

import org.bitbucket.eniqen.dao.impl.ClientDaoImpl;
import org.bitbucket.eniqen.model.Client;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceUnit;
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
@WebServlet("/hello")
public class FirstServlet extends HttpServlet {

    @PersistenceUnit()
    private EntityManagerFactory emf;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        emf = Persistence.createEntityManagerFactory("ISFMO");
        EntityManager entityManager = emf.createEntityManager();
        List<Client> clientList = new ClientDaoImpl(entityManager).getAll();
        req.setAttribute("employees", clientList);
        req.getRequestDispatcher("/WEB-INF/employees.jsp").forward(req, resp);
    }
}
