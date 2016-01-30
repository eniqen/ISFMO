package org.bitbucket.eniqen.controller.contract;

import org.bitbucket.eniqen.exception.ExceptionInfoHandler;
import org.bitbucket.eniqen.model.Contract;
import org.bitbucket.eniqen.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by Mikhail on 02.12.2015.
 */

@RestController
@RequestMapping(ContractController.REST_URL)
public class ContractController extends ExceptionInfoHandler {

    protected static final String REST_URL = "/ajax/contracts";

    @Autowired
    private ContractService contractService;

    @RequestMapping(value = "/add", method = RequestMethod.POST, headers = "accept=application/json")
    public void save(@RequestBody Contract contract) {
        if (contract.getId() == 0) {
            contract.setId(null);
        }
        this.contractService.save(contract);
    }

    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public List<Contract> getAll() {
        return this.contractService.getAll();
    }

    @RequestMapping(value = "/{id}/edit")
    public Contract getContractById(@PathVariable long id) {
        return contractService.getById(id);
    }

    @RequestMapping(value = "/{id}/delete", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") long id) {
        this.contractService.deleteById(id);
    }
}
