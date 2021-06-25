package tw.com.iii.OceanCatHouse.model;


import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Entity
@Table(name = "orders")
public class OrdersBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderid;
    private Integer userid;
    private Date ordercreateon;
    private Integer orderstatusid;
    private  String address;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "orderstatusid", referencedColumnName = "orderstatusid",insertable = false, updatable = false)
    private OrderStatusBean orderStatusBean;

    @JsonIgnore
    @OneToMany( cascade = CascadeType.ALL) // mappedBy = "ordersBean",
    @JoinColumn(name = "orderid", referencedColumnName = "orderid")
    private List<OrderDetailBean> orderDetailBeans = new LinkedList<>();

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getOrdercreateon() {
        return ordercreateon;
    }

    public void setOrdercreateon(Date ordercreateon) {
        this.ordercreateon = ordercreateon;
    }

    public Integer getOrderstatusid() {
        return orderstatusid;
    }

    public void setOrderstatusid(Integer orderstatusid) {
        this.orderstatusid = orderstatusid;
    }

    @Override
    public String toString() {
        return "OrdersBean{" +
                "orderid=" + orderid +
                ", userid=" + userid +
                ", ordercreateon=" + ordercreateon +
                ", orderstatusid=" + orderstatusid +
                ", address='" + address + '\'' +
                ", orderStatusBean=" + orderStatusBean.getOrderstatusid() +
                ", orderDetailBeans=" + orderDetailBeans +
                '}';
    }

    public OrderStatusBean getOrderStatusBean() {
        return orderStatusBean;
    }

    public void setOrderStatusBean(OrderStatusBean orderStatusBean) {
        this.orderStatusBean = orderStatusBean;
    }

    public List<OrderDetailBean> getOrderDetailBeans() {
        return orderDetailBeans;
    }

    public void setOrderDetailBeans(List<OrderDetailBean> orderDetailBeanList) {
        this.orderDetailBeans = orderDetailBeanList;
    }
}
