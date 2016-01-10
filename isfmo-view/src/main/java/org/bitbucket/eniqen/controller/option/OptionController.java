package org.bitbucket.eniqen.controller.option;

import org.bitbucket.eniqen.exception.ExceptionInfoHandler;
import org.bitbucket.eniqen.model.Option;
import org.bitbucket.eniqen.service.OptionService;
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
@RequestMapping(OptionController.REST_URL)
public class OptionController extends ExceptionInfoHandler {

    public static final String REST_URL = "/ajax/options";

    @Autowired
    private OptionService optionService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void save(@Valid @RequestBody Option option, BindingResult result, SessionStatus status) {
        if (result.hasErrors()) {
            throw LOG.getValidationException(result);
        }

        status.setComplete();
        if (option.getId() == 0) {
            option.setId(null);
        }
        this.optionService.save(option);
    }

    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public List<Option> getAll() {
        return this.optionService.getAll();
    }

    @RequestMapping(value = "/{id}/edit")
    public Option getTariffById(@PathVariable long id) {
        return optionService.getById(id);
    }

    @RequestMapping(value = "/{id}/delete", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") long id) {
        this.optionService.deleteById(id);
    }
}
