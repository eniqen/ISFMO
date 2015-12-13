package org.bitbucket.eniqen.controller;

import org.bitbucket.eniqen.dao.ClientDAO;
import org.bitbucket.eniqen.dao.impl.ClientDAOImpl;
import org.bitbucket.eniqen.model.Client;
import org.springframework.beans.factory.annotation.Autowired;

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
@WebServlet(name = "FirstServlet", urlPatterns = {"/cabinet"})
public class FirstServlet extends HttpServlet {
    @Autowired
    ClientDAO clientDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Client> clientList = clientDAO.getAll();
        req.setAttribute("employees", clientList);
        req.getRequestDispatcher("/WEB-INF/view/employees.jsp").forward(req, resp);
    }
}
