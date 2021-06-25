package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "order_status")
public class OrderStatusBean {

    @Id
    private Integer orderstatusid;
    private String statusname;

    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "orderstatusid", referencedColumnName = "orderstatusid")
    private List<OrdersBean> ordersBeans;

    public List<OrdersBean> getOrdersBeans() {
        return ordersBeans;
    }

    public void setOrdersBeans(List<OrdersBean> ordersBeans) {
        this.ordersBeans = ordersBeans;
    }

    public Integer getOrderstatusid() {
        return orderstatusid;
    }

    public void setOrderstatusid(Integer orderstatusid) {
        this.orderstatusid = orderstatusid;
    }

    @Override
    public String toString() {
        return "OrderStatusBean{" +
                "orderstatusid=" + orderstatusid +
                ", statusname='" + statusname + '\'' +
                ", ordersBeans=" + ordersBeans +
                '}';
    }

    public String getStatusname() {
        return statusname;
    }

    public void setStatusname(String statusname) {
        this.statusname = statusname;
    }

}
