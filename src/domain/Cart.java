package domain;

import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
    private Map<String,CartItem> goodsMap = new LinkedHashMap<>();

    private double price;

    public void addGoods(Goods goods){
        CartItem cartItem =goodsMap.get(goods.getGoods_id());
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setGoods(goods);
            cartItem.setQuantity(1);
            goodsMap.put(goods.getGoods_id(), cartItem);
        } else {
            cartItem.setQuantity(cartItem.getQuantity() + 1);
        }
    }


    public Map<String, CartItem> getGoodsMap() {
        return goodsMap;
    }

    public void setGoodsMap(Map<String, CartItem> goodsMap) {
        this.goodsMap = goodsMap;
    }

    public double getPrice() {
        double totalPrice = 0;
        for (Map.Entry<String, CartItem> me : goodsMap.entrySet()) {
            CartItem cartItem = me.getValue();
            totalPrice += cartItem.getPrice();
        }
        return totalPrice;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
