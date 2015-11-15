package org.bitbucket.eniqen.service.impl;

import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;
import org.bitbucket.eniqen.repository.*;
import org.bitbucket.eniqen.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Service
public class ClientServiceImpl implements ClientService {

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private ClientRepository clientRepository;
    @Autowired
    private ContractRepository contractRepository;
    @Autowired
    private OptionRepository optionRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private TariffRepository tariffRepository;

    @Override
    public List<Contract> findAllContractsByClient(Client client) {
        return contractRepository.findByClient(client);
    }
}
