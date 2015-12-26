package org.bitbucket.eniqen.controller.contract;

import org.bitbucket.eniqen.dao.ContractDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by Mikhail on 02.12.2015.
 */

@Controller
public class ContractController {

    @Autowired
    private ContractDAO contractDAO;

}
