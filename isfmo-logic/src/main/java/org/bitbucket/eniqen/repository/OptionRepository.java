package org.bitbucket.eniqen.repository;

import org.bitbucket.eniqen.model.Option;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Transactional(readOnly = true)
@Repository
public interface OptionRepository extends CrudRepository<Option, Long> {
    @Override
    Option save(Option entity);

    @Override
    Option findOne(Long aLong);

    @Override
    boolean exists(Long aLong);

    @Override
    Iterable<Option> findAll();

    @Override
    long count();

    @Override
    void delete(Long aLong);

    @Override
    void delete(Option entity);
}
