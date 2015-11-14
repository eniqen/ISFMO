package org.bitbucket.eniqen.repository;

import org.bitbucket.eniqen.model.Client;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Transactional(readOnly = true)
@Repository
public interface ClientRepository extends CrudRepository<Client, Long> {
    @Override
    Client save(Client entity);

    @Override
    @Query("select c from Client c where id =: id")
    Client findOne(@Param("id") Long integer);

    @Override
    boolean exists(Long integer);

    @Override
    @Query("select c from Client c")
    Iterable<Client> findAll();

    @Override
    @Query("select count(c) as count from Client c")
    long count();

    @Override
    @Transactional
    @Modifying
    @Query("delete from Client c where c.id =: id")
    void delete(@Param("id") Long integer);

    @Override
    @Transactional
    @Modifying
    @Query("delete from Client c where c =: client")
    void delete(@Param("client") Client entity);

    @Query("select c from Client c where c.email =: email")
    Client findByEmail(@Param("email") String email);

    @Query("select c from Client c where c.email =: name")
    Client findByName(@Param("name") String name);
}
