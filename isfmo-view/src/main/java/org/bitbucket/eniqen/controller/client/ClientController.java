package org.bitbucket.eniqen.controller.client;

import org.bitbucket.eniqen.exception.ExceptionInfoHandler;
import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by Mikhail on 02.12.2015.
 */

@RestController
@RequestMapping(ClientController.REST_URL)
public class ClientController extends ExceptionInfoHandler {

    public static final String REST_URL = "/ajax/clients";

    @Autowired
    public ClientService clientService;

    /**
     * Поиск клиентов по введенному параметру
     *
     * @param pattern поисковая строва
     * @return результат поиска по Клиентам
     */
    @RequestMapping(value = "/search")
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

    @RequestMapping(value = "/{id}/edit")
    public Client getClientProfile(@PathVariable long id) {
        return clientService.getById(id);
    }

    /**
     * Метод добавления клиента Ajax Json
     *
     * @param client
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void save(@Valid Client client, BindingResult result, SessionStatus status) {
        if (result.hasErrors()) {
            throw LOG.getValidationException(result);
        } else {
            status.setComplete();
            if (client.getId() == 0) {
                client.setId(null);
            }
            this.clientService.save(client);
        }
    }

    @RequestMapping(value = "/{id}/delete", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") long id) {
        this.clientService.deleteById(id);
    }


    @RequestMapping(method = RequestMethod.GET)
    public List<Client> getAll() {
        return this.clientService.getAll();
    }
}
