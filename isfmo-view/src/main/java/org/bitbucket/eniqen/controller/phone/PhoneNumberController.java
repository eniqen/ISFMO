package org.bitbucket.eniqen.controller.phone;

import org.bitbucket.eniqen.exception.ExceptionInfoHandler;
import org.bitbucket.eniqen.model.PhoneNumber;
import org.bitbucket.eniqen.service.PhoneNumberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by Mikhail on 02.12.2015.
 */

@RestController
@RequestMapping(PhoneNumberController.REST_URL)
public class PhoneNumberController extends ExceptionInfoHandler {
    static final String REST_URL = "/ajax/numbers";

    @Autowired
    private PhoneNumberService phoneNumberService;

    @RequestMapping(method = RequestMethod.GET)
    public List<PhoneNumber> getAll() {
        return this.phoneNumberService.getAllFree();
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void save(@Valid PhoneNumber phoneNumber, BindingResult result, SessionStatus status) {
        if (result.hasErrors()) {
            throw LOG.getValidationException(result);
        }
        status.setComplete();
        if (phoneNumber.getId() == 0) {
            phoneNumber.setId(null);
        }
        this.phoneNumberService.save(phoneNumber);
    }

    @RequestMapping(value = "/{id}/edit")
    public PhoneNumber getNumberById(@PathVariable long id) {
        return phoneNumberService.getById(id);
    }

    @RequestMapping(value = "/{id}/delete", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") long id) {
        this.phoneNumberService.deleteById(id);
    }
}
