package org.bitbucket.eniqen.controller.user;

import org.bitbucket.eniqen.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by Mikhail on 06.01.2016.
 */

@Controller
public class UserController {

    @Autowired
    private UserService userService;
}
