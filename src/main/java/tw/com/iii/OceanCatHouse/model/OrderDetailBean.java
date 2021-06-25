package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "order_detail")
public class OrderDetailBean{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderdetailid;
    private Integer orderid;
    private Integer productid;
    private Integer sellingprice;
    private Integer quantity;
    private Integer discount;

    @JsonIgnore
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "orderid", referencedColumnName = "orderid",insertable = false, updatable = false)
    private OrdersBean ordersBean;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "productid", referencedColumnName = "productid", insertable = false, updatable = false)
    private ProductBean productBean;

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

    @Override
    public String toString() {
        return "OrderDetailBean{" +
                "orderdetailid=" + orderdetailid +
                ", orderid=" + orderid +
                ", productid=" + productid +
                ", sellingprice=" + sellingprice +
                ", quantity=" + quantity +
                ", discount=" + discount +
//                ", ordersBean=" + ordersBean.getOrderid() +
//                ", productBean=" + productBean.getProductid() +
                '}';
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public OrdersBean getOrdersBean() {
        return ordersBean;
    }

    public void setOrdersBean(OrdersBean ordersBean) {
        this.ordersBean = ordersBean;
    }

    public ProductBean getProductBean() {
        return productBean;
    }

    public void setProductBean(ProductBean productBean) {
        this.productBean = productBean;
    }
}
