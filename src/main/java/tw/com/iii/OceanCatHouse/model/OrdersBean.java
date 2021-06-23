package tw.com.iii.OceanCatHouse.model;


import javax.persistence.*;
import java.util.Date;

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

    @Override
    public String toString() {
        return "OrdersBean{" +
                "orderid=" + orderid +
                ", userid=" + userid +
                ", ordercreateon=" + ordercreateon +
                ", orderstatusid=" + orderstatusid +
                ", address='" + address + '\'' +
                '}';
    }

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
}
