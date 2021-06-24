package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "order_detail")
public class OrderDetailBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderdetailid;
    private Integer orderid;
    private Integer productid;
    private Integer sellingprice;
    private Integer unit;
    private Integer discount;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "orderid", referencedColumnName = "orderid",insertable = false, updatable = false)
    private OrdersBean ordersBean;

    public Integer getOrderdetailid() {
        return orderdetailid;
    }

    public void setOrderdetailid(Integer orderdetailid) {
        this.orderdetailid = orderdetailid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Integer getSellingprice() {
        return sellingprice;
    }

    public void setSellingprice(Integer sellingprice) {
        this.sellingprice = sellingprice;
    }

    public Integer getUnit() {
        return unit;
    }

    public void setUnit(Integer unit) {
        this.unit = unit;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "OrderDetailBean{" +
                "orderdetailid=" + orderdetailid +
                ", orderid=" + orderid +
                ", productid=" + productid +
                ", sellingprice=" + sellingprice +
                ", unit=" + unit +
                ", discount=" + discount +
                ", ordersBean=" + ordersBean.getOrderid() +
                '}';
    }

    public OrdersBean getOrdersBean() {
        return ordersBean;
    }

    public void setOrdersBean(OrdersBean ordersBean) {
        this.ordersBean = ordersBean;
    }
}
