package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.dao.PhoneNumberDAO;
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
public class PhoneNumberServiceImpl implements PhoneNumberService {

    @Autowired
    private PhoneNumberDAO phoneNumberDao;

    @Override
    public PhoneNumber getById(Long id) {
        return this.phoneNumberDao.getById(id);
    }

    @Override
    @Transactional
    public void delete(PhoneNumber model) {
        this.phoneNumberDao.delete(model);
    }

    @Override
    @Transactional
    public void save(PhoneNumber model) {
        this.phoneNumberDao.save(model);
    }

    @Override
    public List<PhoneNumber> getAll() {
        return this.phoneNumberDao.getAll();
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        PhoneNumber phoneNumber = this.phoneNumberDao.getById(id);
        this.phoneNumberDao.delete(phoneNumber);
    }

    @Override
    public List<PhoneNumber> getAllFree() {
        return this.phoneNumberDao.getAllFree();
    }
}
