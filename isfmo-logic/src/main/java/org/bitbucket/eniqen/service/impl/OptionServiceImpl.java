package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.dao.OptionDAO;
import org.bitbucket.eniqen.model.Option;
import org.bitbucket.eniqen.service.OptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Mikhail on 23.12.2015.
 */

@Service
public class OptionServiceImpl implements OptionService {

    @Autowired
    private OptionDAO optionDAO;

    @Override
    public Option getById(Long id) {
        return this.optionDAO.getById(id);
    }

    @Override
    @Transactional
    public void delete(Option model) {
        this.optionDAO.delete(model);
    }

    @Override
    @Transactional
    public void save(Option model) {
        this.optionDAO.save(model);
    }

    @Override
    public List<Option> getAll() {
        return this.optionDAO.getAll();
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        Option option = this.optionDAO.getById(id);
        this.optionDAO.delete(option);
    }
}
