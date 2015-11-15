package org.bitbucket.eniqen.repository;

import org.bitbucket.eniqen.model.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Transactional(readOnly = true)
@Repository
public interface RoleRepository extends CrudRepository<Role, Long> {

    List<Role> findByName(String name);

    @Override
    Role save(Role entity);

    @Override
    Role findOne(Long aLong);

    @Override
    boolean exists(Long aLong);

    @Override
    Iterable<Role> findAll();

    @Override
    long count();

    @Override
    void delete(Long aLong);

    @Override
    void delete(Role entity);
}
