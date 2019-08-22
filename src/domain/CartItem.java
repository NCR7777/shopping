package domain;

public class CartItem {
    private Goods goods;
    private int quantity;
    private double price;

    public CartItem(Goods goods, int quantity, double price) {
        this.goods = goods;
        this.quantity = quantity;
        this.price = price;
    }

    public CartItem() {
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return Double.parseDouble(goods.getGoods_price()) * this.quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
