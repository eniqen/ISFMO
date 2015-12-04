package org.bitbucket.eniqen.controller;

import org.bitbucket.eniqen.dao.ClientDAO;
import org.bitbucket.eniqen.model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Mikhail on 02.12.2015.
 */

@Controller
@RequestMapping("/operator")
public class ClientController {

    @Autowired
    private ClientDAO clientDAO;

    @RequestMapping(value = "/addEmployee", method = RequestMethod.POST)
    public void createEmployee(@ModelAttribute Client client) {
        this.clientDAO.add(client);
    }

    @RequestMapping(value = "/showEmployees", method = RequestMethod.GET)
    public ModelAndView showEmployees() {
        return new ModelAndView("employees", "clients", this.clientDAO.getAll());
    }

    @RequestMapping(value = "/deleteClient", method = RequestMethod.GET)
    public ModelAndView editEmployee(@RequestParam(value = "id") long id) {
        Client client = this.clientDAO.getById(id);
        this.clientDAO.delete(client);
        return new ModelAndView("employees", "clients", clientDAO.getAll());
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public ModelAndView searchClient(@RequestParam("pattern") String pattern){
        return new ModelAndView("employees", "clients", clientDAO.findByEmail(pattern));
    }
}