package org.bitbucket.eniqen.controller;

import org.bitbucket.eniqen.model.Option;
import org.bitbucket.eniqen.model.ShopCart;
import org.bitbucket.eniqen.service.OptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Mikhail on 21.02.2016.
 */

@Controller
@RequestMapping(ShopCartController.REST_URI)
@Scope("request")
public class ShopCartController {

    protected static final String REST_URI = "/ajax/shopCart";

    @Autowired
    OptionService optionService;

    @Autowired
    ShopCart shopCart;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    void addToCart(@RequestBody Long id) {
        Option option = optionService.getById(id);
        Map<Option, Integer> items = shopCart.getItems();

        if (items.containsKey(option)) {
            items.put(option, items.get(option) + 1);
        } else {
            items.put(option, 1);
        }
        shopCart.setItems(items);
    }
}
