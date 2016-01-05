package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.dao.UserDao;
import org.bitbucket.eniqen.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Mikhail on 05.01.2016.
 */

@Service
@Transactional(readOnly = true)
public class UserServiceImpl implements UserDetailsService {

    @Autowired
    UserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = this.userDao.findUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException(String.format("username %s not found", username));
        }
        return user;
    }
}
