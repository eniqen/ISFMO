package org.bitbucket.eniqen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Mikhail on 05.12.2015.
 */

@Controller
public class LoginController {

    @RequestMapping(method = RequestMethod.GET)
    public String loginPage(Model model) {
        return "login";
    }
}
