package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.dao.TariffDAO;
import org.bitbucket.eniqen.model.Tariff;
import org.bitbucket.eniqen.service.TariffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Mikhail on 23.12.2015.
 */

@Service
@Transactional(readOnly = true)
public class TariffServiceImpl implements TariffService {

    @Autowired
    private TariffDAO tariffDAO;

    @Override
    public Tariff getById(Long id) {
        return this.tariffDAO.getById(id);
    }

    @Override
    public void delete(Tariff model) {
        this.tariffDAO.delete(model);
    }

    @Override
    public void save(Tariff model) {
        this.tariffDAO.save(model);
    }

    @Override
    public List<Tariff> getAll() {
        return this.tariffDAO.getAll();
    }

    @Override
    public void deleteById(Long id) {
        Tariff tariff = this.tariffDAO.getById(id);
        this.tariffDAO.delete(tariff);
    }
}
