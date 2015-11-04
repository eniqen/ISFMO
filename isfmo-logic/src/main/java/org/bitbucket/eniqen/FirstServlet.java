package org.bitbucket.eniqen;

import org.bitbucket.eniqen.dao.impl.ClientDaoImpl;
import org.bitbucket.eniqen.model.Client;

import javax.persistence.*;
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
        StringBuilder sb = new StringBuilder("<html><body><h1></h1><table border=\"1\">");
        for (Client client : clientList) {
            sb.append("<tr><td>").append(client.getId()).append("</td><td>")
                    .append(client.getFirstname()).append("</td><td>")
                    .append(client.getLastname()).append("</td><td>")
                    .append(client.getPassport()).append("</td><td>")
                    .append(client.getBirthday()).append("</td><td>")
                    .append(client.getPassport()).append("</td><td>")
                    .append(client.getEmail()).append("</td><td>")
                    .append(client.getPassport()).append("</td><td>")
                    .append(client.getRole()).append("</td></tr>");
        }
        sb.append("</table></body></html>");
        resp.getOutputStream().write(sb.toString().getBytes());
    }
}
