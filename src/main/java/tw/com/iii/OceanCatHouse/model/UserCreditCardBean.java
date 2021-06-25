package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "user_credit_card")
public class UserCreditCardBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer CardId;
    private Integer userid;
    private String CardName;
    private String CardNumberP1;
    private String CardNumberP2;
    private String CardNumberP3;
    private String CardNumberP4;
    private String ExpireMonth;
    private String ExpireYear;
    private String VerificationCode;
    private Integer UseCard;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "userid", referencedColumnName = "userid", insertable = false, updatable = false)
    private UserBean userBean;

    public Integer getCardId() {
        return CardId;
    }

    public void setCardId(Integer cardId) {
        CardId = cardId;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "UserCreditCardBean{" +
                "CardId=" + CardId +
                ", userid=" + userid +
                ", CardName='" + CardName + '\'' +
                ", CardNumberP1='" + CardNumberP1 + '\'' +
                ", CardNumberP2='" + CardNumberP2 + '\'' +
                ", CardNumberP3='" + CardNumberP3 + '\'' +
                ", CardNumberP4='" + CardNumberP4 + '\'' +
                ", ExpireMonth='" + ExpireMonth + '\'' +
                ", ExpireYear='" + ExpireYear + '\'' +
                ", VerificationCode='" + VerificationCode + '\'' +
                ", UseCard=" + UseCard +
                ", userBean=" + userBean.getUserid() +
                '}';
    }

    public String getCardName() {
        return CardName;
    }

    public void setCardName(String cardName) {
        CardName = cardName;
    }

    public String getCardNumberP1() {
        return CardNumberP1;
    }

    public void setCardNumberP1(String cardNumberP1) {
        CardNumberP1 = cardNumberP1;
    }

    public String getCardNumberP2() {
        return CardNumberP2;
    }

    public void setCardNumberP2(String cardNumberP2) {
        CardNumberP2 = cardNumberP2;
    }

    public String getCardNumberP3() {
        return CardNumberP3;
    }

    public void setCardNumberP3(String cardNumberP3) {
        CardNumberP3 = cardNumberP3;
    }

    public String getCardNumberP4() {
        return CardNumberP4;
    }

    public void setCardNumberP4(String cardNumberP4) {
        CardNumberP4 = cardNumberP4;
    }

    public String getExpireMonth() {
        return ExpireMonth;
    }

    public void setExpireMonth(String expireMonth) {
        ExpireMonth = expireMonth;
    }

    public String getExpireYear() {
        return ExpireYear;
    }

    public void setExpireYear(String expireYear) {
        ExpireYear = expireYear;
    }

    public String getVerificationCode() {
        return VerificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        VerificationCode = verificationCode;
    }

    public Integer getUseCard() {
        return UseCard;
    }

    public void setUseCard(Integer useCard) {
        UseCard = useCard;
    }

    public UserBean getUserBean() {
        return userBean;
    }

    public void setUserBean(UserBean userBean) {
        this.userBean = userBean;
    }
}
