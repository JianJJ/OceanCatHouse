package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "user_payment_method")
public class UserPaymentMethodBean {

    @Id
    private Integer PaymentId;
    private String Species;

    @Override
    public String toString() {
        return "UserPaymentMethodBean{" +
                "PaymentId=" + PaymentId +
                ", Species='" + Species + '\'' +
                '}';
    }

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
}
