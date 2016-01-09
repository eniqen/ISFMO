package org.bitbucket.eniqen.controller.tariff;

import org.bitbucket.eniqen.exception.ExceptionInfoHandler;
import org.bitbucket.eniqen.model.Tariff;
import org.bitbucket.eniqen.service.TariffService;
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
@RequestMapping(TariffController.REST_URL)
public class TariffController extends ExceptionInfoHandler {

    public static final String REST_URL = "/ajax/tariffs";

    @Autowired
    private TariffService tariffService;

    @RequestMapping(value = "/add", method = RequestMethod.POST, headers = "accept=application/json")
    public void save(@Valid @RequestBody Tariff tariff, BindingResult result, SessionStatus status) {
        if (result.hasErrors()) {
            throw LOG.getValidationException(result);
        }
        status.setComplete();
        if (tariff.getId() == 0) {
            tariff.setId(null);
        }
        this.tariffService.save(tariff);
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Tariff> getAll() {
        return this.tariffService.getAll();
    }

    @RequestMapping(value = "/{id}/edit")
    public Tariff getTariffById(@PathVariable long id) {
        return tariffService.getById(id);
    }

    @RequestMapping(value = "/{id}/delete", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") long id) {
        this.tariffService.deleteById(id);
    }
}
