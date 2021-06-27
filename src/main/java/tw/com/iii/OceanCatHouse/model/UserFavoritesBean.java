package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "user_favorites")
public class UserFavoritesBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer FavoriteId;
    private Integer userid;
    private Integer RecId;
    private String FavoriteCategoryName;

    public String getFavoriteCategoryName() {
        return FavoriteCategoryName;
    }

    public void setFavoriteCategoryName(String favoriteCategoryName) {
        FavoriteCategoryName = favoriteCategoryName;
    }

    @Override
    public String toString() {
        return "UserFavoritesBean{" +
                "FavoriteId=" + FavoriteId +
                ", userid=" + userid +
                ", RecId=" + RecId +
                ", FavoriteCategory='" + FavoriteCategoryName + '\'' +
                ", userBean=" + userBean.getUserid() +
                '}';
    }

    public UserBean getUserBean() {
        return userBean;
    }

    public void setUserBean(UserBean userBean) {
        this.userBean = userBean;
    }

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "userid", referencedColumnName = "userid", insertable = false, updatable = false)
    private UserBean userBean;

    public Integer getFavoriteId() {
        return FavoriteId;
    }

    public void setFavoriteId(Integer favoriteId) {
        FavoriteId = favoriteId;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getRecId() {
        return RecId;
    }

    public void setRecId(Integer recId) {
        RecId = recId;
    }

    public String getFavoriteCategory() {
        return FavoriteCategoryName;
    }

    public void setFavoriteCategory(String favoriteCategory) {
        FavoriteCategoryName = favoriteCategory;
    }
}
