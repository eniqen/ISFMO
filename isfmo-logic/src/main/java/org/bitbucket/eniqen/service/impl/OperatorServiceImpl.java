package org.bitbucket.eniqen.service.impl;

import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by Mikhail Nemenko on 14.11.2015.
 */

@Service
public class OperatorServiceImpl {
    @PersistenceContext
    private EntityManager em;
}
