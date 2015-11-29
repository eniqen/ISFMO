package org.bitbucket.eniqen.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Mikhail on 29.11.2015.
 */

@MappedSuperclass
public class BaseEntity implements Serializable {

    @Id
    @Column(name = "ID", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
