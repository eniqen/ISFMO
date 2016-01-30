package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.dao.UserDao;
import org.bitbucket.eniqen.model.User;
import org.bitbucket.eniqen.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Mikhail on 05.01.2016.
 */

@Service
public class UserServiceImpl implements UserService, UserDetailsService {

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

    @Override
    public User getById(Long id) {
        return this.userDao.getById(id);
    }

    @Override
    @Transactional
    public void delete(User model) {
        this.userDao.delete(model);
    }

    @Override
    @Transactional
    public void save(User model) {
        this.userDao.save(model);
    }

    @Override
    public List<User> getAll() {
        return this.userDao.getAll();
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        User user = this.getById(id);
        this.userDao.delete(user);
    }

    @Override
    public User findUserByUsername(String username) {
        return this.userDao.findUserByUsername(username);
    }
}
