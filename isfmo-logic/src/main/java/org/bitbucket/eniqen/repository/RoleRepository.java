package org.bitbucket.eniqen.repository;

import org.bitbucket.eniqen.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Mikhail Nemenko on 01.11.2015.
 */
public interface RoleRepository extends JpaRepository<Role, Integer> {
}
