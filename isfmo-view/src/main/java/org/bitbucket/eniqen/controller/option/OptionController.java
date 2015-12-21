package org.bitbucket.eniqen.controller.option;

import org.bitbucket.eniqen.dao.OptionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Mikhail on 02.12.2015.
 */

@Controller
public class OptionController {

    @Autowired
    private OptionDAO optionDAO;

    @RequestMapping(value = "/options", method = RequestMethod.GET)
    public ModelAndView showOptions() {
        return new ModelAndView("options", "options", this.optionDAO.getAll());
    }
}
