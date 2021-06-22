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
    private Integer CardNumberP1;
    private Integer CardNumberP2;
    private Integer CardNumberP3;
    private Integer CardNumberP4;
    private String EffectiveDate;
    private Integer VerificationCode;
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

    public Integer getCardNumberP1() {
        return CardNumberP1;
    }

    public void setCardNumberP1(Integer cardNumberP1) {
        CardNumberP1 = cardNumberP1;
    }

    public Integer getCardNumberP2() {
        return CardNumberP2;
    }

    public void setCardNumberP2(Integer cardNumberP2) {
        CardNumberP2 = cardNumberP2;
    }

    public Integer getCardNumberP3() {
        return CardNumberP3;
    }

    public void setCardNumberP3(Integer cardNumberP3) {
        CardNumberP3 = cardNumberP3;
    }

    public Integer getCardNumberP4() {
        return CardNumberP4;
    }

    public void setCardNumberP4(Integer cardNumberP4) {
        CardNumberP4 = cardNumberP4;
    }

    public String getEffectiveDate() {
        return EffectiveDate;
    }

    public void setEffectiveDate(String effectiveDate) {
        EffectiveDate = effectiveDate;
    }

    public Integer getVerificationCode() {
        return VerificationCode;
    }

    public void setVerificationCode(Integer verificationCode) {
        VerificationCode = verificationCode;
    }

    @Override
    public String toString() {
        return "UserCreditCardBean{" +
                "CardId=" + CardId +
                ", userid=" + userid +
                ", CardNumberP1=" + CardNumberP1 +
                ", CardNumberP2=" + CardNumberP2 +
                ", CardNumberP3=" + CardNumberP3 +
                ", CardNumberP4=" + CardNumberP4 +
                ", EffectiveDate='" + EffectiveDate + '\'' +
                ", VerificationCode=" + VerificationCode +
                ", UseCard=" + UseCard +
                ", userBean=" + userBean.getUserid() +
                '}';
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
