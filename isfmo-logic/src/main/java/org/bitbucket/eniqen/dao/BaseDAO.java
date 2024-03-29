package org.bitbucket.eniqen.dao;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Базовый Дао с основными операциями
 *
 * @version 1.0
 */

public interface BaseDAO<T extends Serializable> {

    List<T> getAll();

    T getById(Long id);

    void delete(T model);

    T save(T model);
}
