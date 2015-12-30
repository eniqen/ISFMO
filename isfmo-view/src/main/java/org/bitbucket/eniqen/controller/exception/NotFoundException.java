package org.bitbucket.eniqen.controller.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Created by Mikhail on 30.12.2015.
 */
@ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "No data found")  // 404
public class NotFoundException extends RuntimeException {
    public NotFoundException(String message) {
        super(message);
    }
}
