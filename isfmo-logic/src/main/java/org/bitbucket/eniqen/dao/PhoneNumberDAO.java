package org.bitbucket.eniqen.dao;

import org.bitbucket.eniqen.model.PhoneNumber;

import java.util.List;

/**
 * Created by Mikhail on 29.11.2015.
 */
public interface PhoneNumberDAO extends BaseDAO<PhoneNumber> {

    List<PhoneNumber> getAllFree();
}
