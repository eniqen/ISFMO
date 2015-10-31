package model;

import java.io.Serializable;

/**
 * Created by Mikhail Nemenko on 31.10.2015.
 * <p>
 * Базовая модель
 *
 * @version 1.0
 */
public class BaseModel implements Serializable {

    private static final long serialVersionUID = 6702986905557497270L;
    private Long id;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BaseModel(Long id) {
        this.id = id;
    }

    public BaseModel() {
    }
}
