package org.bitbucket.eniqen.controller;

import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.service.ClientService;
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
    public ClientService clientService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String createClient(@ModelAttribute Client client) {
        this.clientService.add(client);
        return "redirect:/operator/clients";
    }

    @RequestMapping(value = "/clients", method = RequestMethod.GET)
    public ModelAndView showClients() {
        return new ModelAndView("employees", "clients", this.clientService.getAll());
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteClient(@RequestParam("id") long id) {
        this.clientService.deleteById(id);
        return "redirect:/operator/clients";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView editEmployee(@RequestParam(value = "id") long id) {
        Client client = this.clientService.getById(id);
        return new ModelAndView("employees", "clients", this.clientService.getAll());
    }
//
//    @RequestMapping(value = "/search", method = RequestMethod.POST)
//    public ModelAndView searchClient(@RequestParam("pattern") String pattern){
//        return new ModelAndView("employees", "clients", this.clientDAO.findByEmail(pattern));
//    }
}
