package dao;

import model.BaseModel;

import java.util.List;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Базовый Дао с основными операциями
 *
 * @version 1.0
 */

public interface BaseDao<T extends BaseModel> {

    List<T> getAll();

    T getById(Long id);

    void add(T model);

    void delete(T model);

    void update(T model);
}
