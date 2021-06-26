package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.LinkedList;
import java.util.List;

@Entity
@Table(name = "user_payment_method")
public class UserPaymentMethodBean {

    @Id
    private Integer PaymentId;
    private String Species;

    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "PaymentId", referencedColumnName = "PaymentId")
    private List<OrdersBean> ordersBeans = new LinkedList<>();

    public Integer getPaymentId() {
        return PaymentId;
    }

    public void setPaymentId(Integer paymentId) {
        PaymentId = paymentId;
    }

    public String getSpecies() {
        return Species;
    }

    public void setSpecies(String species) {
        Species = species;
    }

    @Override
    public String toString() {
        return "UserPaymentMethodBean{" +
                "PaymentId=" + PaymentId +
                ", Species='" + Species + '\'' +
                ", ordersBeans=" + ordersBeans +
                '}';
    }

    public List<OrdersBean> getOrdersBeans() {
        return ordersBeans;
    }

    public void setOrdersBeans(List<OrdersBean> ordersBeans) {
        this.ordersBeans = ordersBeans;
    }
}
