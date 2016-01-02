package org.bitbucket.eniqen.util;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by Mikhail on 02.01.2016.
 */

@Component
public class PasswordUtil implements PasswordEncoder {

    private MessageDigest md;

    public PasswordUtil() {
        try {
            this.md = MessageDigest.getInstance("MD5");
        } catch(NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String encode(CharSequence charSequence) {
        if (this.md == null) {
            return charSequence.toString();
        }

        this.md.update(charSequence.toString().getBytes());
        byte[] byteData = md.digest();

        StringBuilder hexString = new StringBuilder();
        for(byte data : byteData) {
            String hex = Integer.toHexString(0xff & data);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

    @Override
    public boolean matches(CharSequence charSequence, String s) {
        return this.encode(charSequence).equals(s);
    }
}
