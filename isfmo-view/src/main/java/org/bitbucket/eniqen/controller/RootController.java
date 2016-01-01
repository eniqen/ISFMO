package org.bitbucket.eniqen.controller;

import org.bitbucket.eniqen.service.ClientService;
import org.bitbucket.eniqen.service.ContractService;
import org.bitbucket.eniqen.service.OptionService;
import org.bitbucket.eniqen.service.TariffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Mikhail on 26.12.2015.
 */

@Controller
public class RootController {
    private ClientService clientService;
    private ContractService contractService;
    private TariffService tariffService;
    private OptionService optionService;

    @Autowired
    public RootController(ClientService clientService, ContractService contractService, TariffService tariffService, OptionService optionService) {
        this.clientService = clientService;
        this.contractService = contractService;
        this.tariffService = tariffService;
        this.optionService = optionService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String root() {
        return "redirect:login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model,
                        @RequestParam(value = "error", required = false) boolean error,
                        @RequestParam(value = "message", required = false) String message) {
        model.put("error", error);
        model.put("message", message);
        return "login";
    }

    @RequestMapping(value = "/clients", method = RequestMethod.GET)
    public ModelAndView clients() {
        return new ModelAndView("clients", "clients", this.clientService.getAll());
    }

    @RequestMapping(value = "/tariffs", method = RequestMethod.GET)
    public ModelAndView tariffs() {
        return new ModelAndView("tariffs", "tariffs", this.tariffService.getAll());
    }

    @RequestMapping(value = "/options", method = RequestMethod.GET)
    public ModelAndView options() {
        return new ModelAndView("options", "options", this.optionService.getAll());
    }

    @RequestMapping(value = "/contracts", method = RequestMethod.GET)
    public ModelAndView contracts() {
        return new ModelAndView("contracts", "contracts", this.contractService.getAll());
    }
    @RequestMapping(value = "/numbers", method = RequestMethod.GET)
    public String numbers() {
        return "numbers";
    }
}
