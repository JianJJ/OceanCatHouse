package tw.com.iii.OceanCatHouse.model;


import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "orders")
public class OrdersBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer OrderId;
    private Integer UserId;
    private Date OrderCreateOn;
    private Integer OrderStatusId;
    private  String address;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "ordersBean{" +
                "OrderId=" + OrderId +
                ", UserId=" + UserId +
                ", OrderCreateOn=" + OrderCreateOn +
                ", OrderStatusId=" + OrderStatusId +
                '}';
    }

    public Integer getOrderId() {
        return OrderId;
    }

    public void setOrderId(Integer orderId) {
        OrderId = orderId;
    }

    public Integer getUserId() {
        return UserId;
    }

    public void setUserId(Integer userId) {
        UserId = userId;
    }

    public Date getOrderCreateOn() {
        return OrderCreateOn;
    }

    public void setOrderCreateOn(Date orderCreateOn) {
        OrderCreateOn = orderCreateOn;
    }

    public Integer getOrderStatusId() {
        return OrderStatusId;
    }

    public void setOrderStatusId(Integer orderStatusId) {
        OrderStatusId = orderStatusId;
    }
}
