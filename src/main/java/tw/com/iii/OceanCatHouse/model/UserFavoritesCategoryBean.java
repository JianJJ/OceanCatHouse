package tw.com.iii.OceanCatHouse.model;

import javax.persistence.*;

@Entity
@Table(name = "user_favorites_category")
public class UserFavoritesCategoryBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer FavoritesCategoryId;
    private Integer userid;
    private String FavoriteCategoryName;

    @Override
    public String toString() {
        return "UserFavoritesCategoryBean{" +
                "FavoritesCategoryId=" + FavoritesCategoryId +
                ", userid=" + userid +
                ", FavoriteCategoryName='" + FavoriteCategoryName + '\'' +
                '}';
    }

    public Integer getFavoritesCategoryId() {
        return FavoritesCategoryId;
    }

    public void setFavoritesCategoryId(Integer favoritesCategoryId) {
        FavoritesCategoryId = favoritesCategoryId;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getFavoriteCategoryName() {
        return FavoriteCategoryName;
    }

    public void setFavoriteCategoryName(String favoriteCategoryName) {
        FavoriteCategoryName = favoriteCategoryName;
    }
}
