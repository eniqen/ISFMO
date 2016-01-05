package org.bitbucket.eniqen.repository;

import org.bitbucket.eniqen.model.UserRole;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Transactional(readOnly = true)
@Repository
public interface RoleRepository extends CrudRepository<UserRole, Long> {

    List<UserRole> findByName(String name);

    @Override
    UserRole save(UserRole entity);

    @Override
    UserRole findOne(Long aLong);

    @Override
    boolean exists(Long aLong);

    @Override
    Iterable<UserRole> findAll();

    @Override
    long count();

    @Override
    void delete(Long aLong);

    @Override
    void delete(UserRole entity);
}
