package org.bitbucket.eniqen.service;

import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 14.11.2015.
 */
public interface ContractService extends BaseService<Contract> {

    List<Contract> findClientContracts (Client client);
}
