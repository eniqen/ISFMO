package org.bitbucket.eniqen.service;

import org.bitbucket.eniqen.model.User;

/**
 * Created by Mikhail on 05.01.2016.
 */


public interface UserService extends BaseService<User> {
    User findUserByUsername(String username);
}
