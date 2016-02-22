package org.bitbucket.eniqen.model;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Map;

/**
 * Created by Mikhail on 21.02.2016.
 */

@Component
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS, value = "session")
public class ShopCart implements Serializable {

    public ShopCart() {
    }

    private Map<Option, Integer> items;
    private double subTotalCost;

    public ShopCart(Map<Option, Integer> items) {
        this.items = items;
    }

    public Map<Option, Integer> getItems() {
        return items;
    }

    public void setItems(Map<Option, Integer> items) {
        this.items = items;
    }

    public int getFoundCount() {
        return this.items.size();
    }

    public void setSubTotalCost(double subTotalCost) {
        this.subTotalCost = subTotalCost;
    }
}
