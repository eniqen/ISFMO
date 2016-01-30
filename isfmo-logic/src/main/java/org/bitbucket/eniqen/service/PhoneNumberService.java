package org.bitbucket.eniqen.service;

import org.bitbucket.eniqen.model.PhoneNumber;

import java.util.List;

/**
 * Created by Mikhail on 23.12.2015.
 */
public interface PhoneNumberService extends BaseService<PhoneNumber> {
    List<PhoneNumber> getAllFree();
}
