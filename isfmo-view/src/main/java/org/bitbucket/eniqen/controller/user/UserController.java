package org.bitbucket.eniqen.controller.user;

import org.bitbucket.eniqen.model.User;
import org.bitbucket.eniqen.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Base64;

/**
 * Created by Mikhail on 06.01.2016.
 */

@RestController
@RequestMapping("/ajax/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/image", method = RequestMethod.GET)
    public String getImage(HttpServletRequest req) {
        String name = req.getUserPrincipal().getName();
        byte[] avatar = this.userService.findUserByUsername(name).getAvatar();
        if (avatar.length > 0) {
            return Base64.getEncoder().encodeToString(avatar);
        }
        return null;
    }

    @RequestMapping(value = "/image", method = RequestMethod.POST)
    public void upload(@RequestParam("file") MultipartFile file, HttpServletRequest req) {
        String name = req.getUserPrincipal().getName();
        User user = this.userService.findUserByUsername(name);
        if (!file.isEmpty()) {
            try {
                user.setAvatar(file.getBytes());
                this.userService.save(user);
            } catch(IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "/image", method = RequestMethod.DELETE)
    public void deleteImage(HttpServletRequest req) {
        String name = req.getUserPrincipal().getName();
        User user = this.userService.findUserByUsername(name);
        if (user != null) {
            user.setAvatar(null);
            this.userService.save(user);
        }
    }
}
