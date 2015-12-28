package org.bitbucket.eniqen.controller.tariff;

import org.bitbucket.eniqen.model.Tariff;
import org.bitbucket.eniqen.service.TariffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by Mikhail on 02.12.2015.
 */

@RestController
@RequestMapping("/ajax/tariffs")
public class TariffController {
    @Autowired
    private TariffService tariffService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public void update(@Valid Tariff tariff, BindingResult bindingResult, Model model) {
        if (tariff.getId() == 0) {
            tariff.setId(null);
            this.tariffService.add(tariff);
        } else {
            this.tariffService.update(tariff);
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Tariff> getAll() {
        return this.tariffService.getAll();
    }

    @RequestMapping(value = "/{id}/edit")
    @ResponseBody
    public Tariff getTariffById(@PathVariable long id) {
        return tariffService.getById(id);
    }

    @RequestMapping(value = "/{id}/delete", method = RequestMethod.DELETE)
    @ResponseBody
    public void delete(@PathVariable("id") long id) {
        this.tariffService.deleteById(id);
    }
}
