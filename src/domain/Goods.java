package domain;

public class Goods {
    private String goods_id;
    private String goods_name;
    private String goods_price;
    private String goods_buildPrice;
    private String goods_spokesman;
    private String goods_pictureSRC;
    private String goods_href;

    public Goods(String goods_id, String goods_name, String goods_price, String goods_buildPrice, String goods_spokesman, String goods_pictureSRC, String goods_href) {
        this.goods_id = goods_id;
        this.goods_name = goods_name;
        this.goods_price = goods_price;
        this.goods_buildPrice = goods_buildPrice;
        this.goods_spokesman = goods_spokesman;
        this.goods_pictureSRC = goods_pictureSRC;
        this.goods_href = goods_href;
    }

    public Goods() {
    }

    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(String goods_price) {
        this.goods_price = goods_price;
    }

    public String getGoods_buildPrice() {
        return goods_buildPrice;
    }

    public void setGoods_buildPrice(String goods_buildPrice) {
        this.goods_buildPrice = goods_buildPrice;
    }

    public String getGoods_spokesman() {
        return goods_spokesman;
    }

    public void setGoods_spokesman(String goods_spokesman) {
        this.goods_spokesman = goods_spokesman;
    }

    public String getGoods_pictureSRC() {
        return goods_pictureSRC;
    }

    public void setGoods_pictureSRC(String goods_pictureSRC) {
        this.goods_pictureSRC = goods_pictureSRC;
    }

    public String getGoods_href() {
        return goods_href;
    }

    public void setGoods_href(String goods_href) {
        this.goods_href = goods_href;
    }
}
