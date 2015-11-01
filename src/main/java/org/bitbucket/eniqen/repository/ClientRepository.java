package org.bitbucket.eniqen.repository;

import org.bitbucket.eniqen.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */
public interface ClientRepository extends JpaRepository<Client, Integer> {
    @Query("select c from Client c where c.lastname = ?1")
    Client findByName(String lastname);
}
