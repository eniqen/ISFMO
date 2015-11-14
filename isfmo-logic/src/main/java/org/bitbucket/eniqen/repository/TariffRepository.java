package org.bitbucket.eniqen.repository;

import org.bitbucket.eniqen.model.Tariff;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Transactional(readOnly = true)
@Repository
public interface TariffRepository extends CrudRepository<Tariff, Integer> {
}
