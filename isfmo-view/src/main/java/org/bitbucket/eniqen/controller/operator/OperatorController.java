package org.bitbucket.eniqen.controller.operator;

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

    /**
     * Удаление клиента
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteClient(@RequestParam("id") long id) {
        this.clientService.deleteById(id);
        return "redirect:/operator/clients";
    }

    /**
     * Поиск клиентов по введенному параметру
     *
     * @param pattern поисковая строва
     * @return результат поиска по Клиентам
     */
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


    /**
     * Получение профиля пользователя
     *
     * @param id идентификатор пользователя
     * @return
     */
    @RequestMapping(value = "/clients/{id}")
    @ResponseBody
    public Client getClientProfile(@PathVariable long id) {
        return clientService.getById(id);
    }

    /**
     * Метод добавления клиента Ajax Json
     *
     * @param client
     */
    @RequestMapping(value = "clients/add", method = RequestMethod.POST)
    @ResponseBody
    public void update(Client client) {
        if (client.getId() == 0) {
            client.setId(null);
            this.clientService.add(client);
        } else {
            this.clientService.update(client);
        }
    }

    @RequestMapping(value = "clients/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public void delete(@PathVariable("id") long id) {
        this.clientService.deleteById(id);
    }
}
