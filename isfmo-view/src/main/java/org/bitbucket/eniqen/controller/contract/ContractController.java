package org.bitbucket.eniqen.controller.contract;

import org.bitbucket.eniqen.exception.ExceptionInfoHandler;
import org.bitbucket.eniqen.model.Contract;
import org.bitbucket.eniqen.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Mikhail on 02.12.2015.
 */

@Controller
@RequestMapping(ContractController.REST_URL)
public class ContractController extends ExceptionInfoHandler {

    protected static final String REST_URL = "/ajax/contracts";

    @Autowired
    private ContractService contractService;

    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST, headers = "accept=application/json")
    public void save(@RequestBody Contract contract) {
        if (contract.getId() == 0) {
            contract.setId(null);
        }
        this.contractService.save(contract);
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public List<Contract> getAll() {
        return this.contractService.getAll();
    }

    @ResponseBody
    @RequestMapping(value = "/{id}/edit")
    public Contract getContractById(@PathVariable long id) {
        return contractService.getById(id);
    }

    @ResponseBody
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") long id) {
        this.contractService.deleteById(id);
    }

    @RequestMapping(value = "/downloadPdf", method = RequestMethod.POST)
    public ModelAndView downloadPDF(@RequestParam("id") long id, HttpServletRequest request) {
        Contract contract = this.contractService.getById(id);
        request.setAttribute("contract", contract);
        return new ModelAndView("pdfView");
    }
}
