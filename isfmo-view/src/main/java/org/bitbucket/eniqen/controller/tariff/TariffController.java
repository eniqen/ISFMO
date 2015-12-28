package org.bitbucket.eniqen.controller.tariff;

import org.bitbucket.eniqen.model.Tariff;
import org.bitbucket.eniqen.service.TariffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Mikhail on 02.12.2015.
 */

@Controller
@RequestMapping("/ajax/tariffs")
public class TariffController {
    @Autowired
    private TariffService tariffService;

    @RequestMapping(value = "/add", method = RequestMethod.POST,  headers = "accept=application/json")
    @ResponseBody
    public void update(@RequestBody Tariff tariff) {
        if (tariff.getId() == 0) {
            tariff.setId(null);
            this.tariffService.add(tariff);
        } else {
            this.tariffService.update(tariff);
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
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
