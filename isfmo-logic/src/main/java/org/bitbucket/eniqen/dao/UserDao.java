package org.bitbucket.eniqen.dao;

import org.springframework.security.core.userdetails.User;

/**
 * Created by Mikhail on 05.01.2016.
 */
public interface UserDao  extends BaseDAO<User> {

    User findUserByUsername(String username);
}
