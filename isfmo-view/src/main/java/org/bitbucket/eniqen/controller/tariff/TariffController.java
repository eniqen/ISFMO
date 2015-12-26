package org.bitbucket.eniqen.controller.tariff;

import org.bitbucket.eniqen.dao.OptionDAO;
import org.bitbucket.eniqen.dao.TariffDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Mikhail on 02.12.2015.
 */

@Controller
public class TariffController {
    @Autowired
    private TariffDAO tariffDAO;

//    @RequestMapping(value = "/tariffs", method = RequestMethod.GET)
//    public ModelAndView showOptions() {
//        return new ModelAndView("tariffs", "tariffs", this.tariffDAO.getAll());
//    }
}
