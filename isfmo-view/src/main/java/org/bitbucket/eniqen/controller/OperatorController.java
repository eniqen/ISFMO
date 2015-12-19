package org.bitbucket.eniqen.controller;

import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by Mikhail on 02.12.2015.
 */

@Controller
@RequestMapping("/operator")
public class OperatorController {

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

    @RequestMapping(value = "/edit")
    @ResponseBody
    public Client edit(@RequestParam(value = "id") long id) {
        return this.clientService.getById(id);
    }

    @RequestMapping(value = "/search")
    @ResponseBody
    public List<Client> search(@RequestParam("pattern") String pattern) {
        return this.clientService.getAll().stream()
                .filter(client -> client.getLastname().toLowerCase().contains
                (pattern.toLowerCase())
                || client.getFirstname().toLowerCase().contains(pattern.toLowerCase())
                || client.getPassport().toLowerCase().contains(pattern.toLowerCase())
                || client.getAddress().toLowerCase().contains(pattern.toLowerCase())
                || client.getEmail().toLowerCase().contains(pattern.toLowerCase())
        ).collect(Collectors.toList());
    }

    @RequestMapping(value = "/profile/{id}")
    @ResponseBody
    public Client getClientProfile(@PathVariable long id){
        return clientService.getById(id);
    }
}
