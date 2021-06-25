package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;


@Entity
@Table(name = "user")
public class UserBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userid;
    private Integer fansnum;//分屍數
    private Integer recnum;//案戰術
    private String username;
    private String userpic;
    private String userphone;
    private Integer LastPay;
    private String DeliveryAddress;
    private String email;
    private String userpassword;
    private String state;

    @JsonIgnore
    @OneToMany(mappedBy = "userBean", cascade = CascadeType.ALL)
    private List<UserFavoritesBean> userFavoritesBeans;

    @JsonIgnore
    @OneToMany(mappedBy = "userBean", cascade = CascadeType.ALL)
    private List<UserCreditCardBean> userCreditCardBeans;

    public List<UserFavoritesBean> getUserFavoritesBeans() {
        return userFavoritesBeans;
    }

    public void setUserFavoritesBeans(List<UserFavoritesBean> userFavoritesBeans) {
        this.userFavoritesBeans = userFavoritesBeans;
    }

    @Override
    public String toString() {
        return "UserBean{" +
                "userid=" + userid +
                ", fansnum=" + fansnum +
                ", recnum=" + recnum +
                ", username='" + username + '\'' +
                ", userpic='" + userpic + '\'' +
                ", userphone='" + userphone + '\'' +
                ", LastPay=" + LastPay +
                ", DeliveryAddress='" + DeliveryAddress + '\'' +
                ", email='" + email + '\'' +
                ", userpassword='" + userpassword + '\'' +
                ", state='" + state + '\'' +
                ", userFavoritesBeans=" + userFavoritesBeans +
                ", userCreditCardBeans=" + userCreditCardBeans +
                '}';
    }

    public List<UserCreditCardBean> getUserCreditCardBeans() {
        return userCreditCardBeans;
    }

    public void setUserCreditCardBeans(List<UserCreditCardBean> userCreditCardBeans) {
        this.userCreditCardBeans = userCreditCardBeans;
    }


    public Integer getLastPay() {
        return LastPay;
    }

    public void setLastPay(Integer lastPay) {
        LastPay = lastPay;
    }

    public String getDeliveryAddress() {
        return DeliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        DeliveryAddress = deliveryAddress;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getFansnum() {
        return fansnum;
    }

    public void setFansnum(Integer fansnum) {
        this.fansnum = fansnum;
    }

    public Integer getRecnum() {
        return recnum;
    }

    public void setRecnum(Integer recnum) {
        this.recnum = recnum;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpic() {
        return userpic;
    }

    public void setUserpic(String userpic) {
        this.userpic = userpic;
    }

    public String getUserphone() {
        return userphone;
    }

    public void setUserphone(String userphone) {
        this.userphone = userphone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }


    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

}
