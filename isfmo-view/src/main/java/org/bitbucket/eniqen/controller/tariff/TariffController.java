package org.bitbucket.eniqen.controller.tariff;

import org.bitbucket.eniqen.model.Tariff;
import org.bitbucket.eniqen.service.OptionService;
import org.bitbucket.eniqen.service.TariffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
    public void update(Tariff tariff) {
        if (tariff.getId() == 0) {
            tariff.setId(null);
            this.tariffService.add(tariff);
        } else {
            this.tariffService.update(tariff);
        }
    }
}
