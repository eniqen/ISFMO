package org.bitbucket.eniqen.service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Mikhail on 23.12.2015.
 */
public interface BaseService<T extends Serializable> {

    T getById(Long id);

    void delete(T model);

    void save(T model);

    List<T> getAll();

    void deleteById(Long id);
}
