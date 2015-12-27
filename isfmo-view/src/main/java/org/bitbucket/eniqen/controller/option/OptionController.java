package org.bitbucket.eniqen.controller.option;

import org.bitbucket.eniqen.model.Option;
import org.bitbucket.eniqen.service.OptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by Mikhail on 02.12.2015.
 */

@RestController
@RequestMapping("/ajax/options")
public class OptionController {

    @Autowired
    private OptionService optionService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void update(Option option) {
        if (option.getId() == 0) {
            option.setId(null);
            this.optionService.add(option);
        } else {
            this.optionService.update(option);
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Option> getAll() {
        return this.optionService.getAll();
    }
}
