package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.dao.PhoneNumberDAO;
import org.bitbucket.eniqen.model.Option;
import org.bitbucket.eniqen.model.PhoneNumber;
import org.bitbucket.eniqen.service.PhoneNumberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Mikhail on 23.12.2015.
 */

@Service
@Transactional(readOnly = true)
public class PhoneNumberServiceImpl implements PhoneNumberService {

    @Autowired
    private PhoneNumberDAO phoneNumberDAO;

    @Override
    public PhoneNumber getById(Long id) {
        return this.phoneNumberDAO.getById(id);
    }

    @Override
    public void add(PhoneNumber model) {
        this.phoneNumberDAO.add(model);
    }

    @Override
    public void delete(PhoneNumber model) {
        this.phoneNumberDAO.delete(model);
    }

    @Override
    public void update(PhoneNumber model) {
        this.phoneNumberDAO.update(model);
    }

    @Override
    public List<PhoneNumber> getAll() {
        return this.phoneNumberDAO.getAll();
    }

    @Override
    public void deleteById(Long id) {
        PhoneNumber phoneNumber = this.phoneNumberDAO.getById(id);
        this.phoneNumberDAO.delete(phoneNumber);
    }
}
