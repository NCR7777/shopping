package domain;

import java.util.LinkedHashMap;
import java.util.Map;

public class Order {
    private int order_id;
    private String user_id;
    private String order_status;
    private double product_totalPrice;
    private String user_address;
    private String pay_channel;
    private String order_time;
    private String user_nickname;
    private String user_phoneNumber;
    private String cart;
    private Map<String,CartItem> orderMap = new LinkedHashMap<>();
    private double adminTotalPrice;

    public double getAdminTotalPrice() {
        return adminTotalPrice;
    }

    public void setAdminTotalPrice(double adminTotalPrice) {
        this.adminTotalPrice = adminTotalPrice;
    }

    public void addGoods(Goods goods){
        CartItem cartItem = orderMap.get(goods.getGoods_id());
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setGoods(goods);
            cartItem.setQuantity(1);
            orderMap.put(goods.getGoods_id(), cartItem);
        } else {
            cartItem.setQuantity(cartItem.getQuantity() + 1);
        }
    }

    public Order(int order_id, String user_id, String order_status, double product_totalPrice, String user_address, String pay_channel, String order_time, String user_nickname, String user_phoneNumber, String cart, Map<String, CartItem> orderMap) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.order_status = order_status;
        this.product_totalPrice = product_totalPrice;
        this.user_address = user_address;
        this.pay_channel = pay_channel;
        this.order_time = order_time;
        this.user_nickname = user_nickname;
        this.user_phoneNumber = user_phoneNumber;
        this.cart = cart;
        this.orderMap = orderMap;
    }

    public Order() {
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    public double getProduct_totalPrice() {
        double totalPrice = 0;
        for (Map.Entry<String, CartItem> me : orderMap.entrySet()) {
            CartItem cartItem = me.getValue();
            totalPrice += cartItem.getPrice();
        }
        return totalPrice;
    }

    public void setProduct_totalPrice(double product_totalPrice) {
        this.product_totalPrice = product_totalPrice;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public String getPay_channel() {
        return pay_channel;
    }

    public void setPay_channel(String pay_channel) {
        this.pay_channel = pay_channel;
    }

    public String getOrder_time() {
        return order_time;
    }

    public void setOrder_time(String order_time) {
        this.order_time = order_time;
    }

    public String getUser_nickname() {
        return user_nickname;
    }

    public void setUser_nickname(String user_nickname) {
        this.user_nickname = user_nickname;
    }

    public String getUser_phoneNumber() {
        return user_phoneNumber;
    }

    public void setUser_phoneNumber(String user_phoneNumber) {
        this.user_phoneNumber = user_phoneNumber;
    }

    public String getCart() {
        return cart;
    }

    public void setCart(String cart) {
        this.cart = cart;
    }

    public Map<String, CartItem> getOrderMap() {
        return orderMap;
    }

}
