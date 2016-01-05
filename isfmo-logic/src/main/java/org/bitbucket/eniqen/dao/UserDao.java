package org.bitbucket.eniqen.dao;


import org.bitbucket.eniqen.model.User;

/**
 * Created by Mikhail on 05.01.2016.
 */
public interface UserDao  extends BaseDAO<User> {

    User findUserByUsername(String username);
}
