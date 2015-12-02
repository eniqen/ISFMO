package org.bitbucket.eniqen.controller;

import org.bitbucket.eniqen.dao.ClientDAO;
import org.bitbucket.eniqen.model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Mikhail on 02.12.2015.
 */

@Controller
public class ClientController {

    @Autowired
    private ClientDAO clientDAO;

    @RequestMapping(value = "/createEmployee", method = RequestMethod.POST)
    public void createEmployee(@ModelAttribute Client client) {
        this.clientDAO.add(client);
    }
}
