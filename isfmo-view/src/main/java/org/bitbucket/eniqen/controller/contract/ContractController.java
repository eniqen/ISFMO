package org.bitbucket.eniqen.controller.contract;

import org.bitbucket.eniqen.dao.ContractDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Mikhail on 02.12.2015.
 */

@Controller
public class ContractController {

    @Autowired
    private ContractDAO contractDAO;

}
