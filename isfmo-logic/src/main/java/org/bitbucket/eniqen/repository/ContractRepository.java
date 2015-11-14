package org.bitbucket.eniqen.repository;

import org.bitbucket.eniqen.model.Client;
import org.bitbucket.eniqen.model.Contract;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */

@Transactional(readOnly = true)
@Repository
public interface ContractRepository extends CrudRepository<Contract, Long> {
    @Override
    Contract save(Contract entity);

    @Override
    @Query("select c from Contract c where id =: id")
    Contract findOne(@Param("id") Long integer);

    @Override
    boolean exists(Long integer);

    @Override
    @Query("select c from Contract c")
    Iterable<Contract> findAll();

    @Override
    @Query("select count(c) as count from Contract c")
    long count();

    @Override
    @Transactional
    @Modifying
    @Query("delete from Contract c where c.id =: id")
    void delete(@Param("id") Long integer);

    @Override
    @Transactional
    @Modifying
    @Query("delete from Contract c where c =: contract")
    void delete(@Param("contract") Contract entity);

    @Query("select c from Contract c where c.number = :number")
    Contract findByNumber(String number);

    @Query("select client from Client client join Contract contract on client = contract.client where contract.number = : number")
    Client findUserByNumber(String number);

    @Query("select c from Contract c where c.client =: client")
    List<Contract> findByClient(@Param("client") Client client);
}
