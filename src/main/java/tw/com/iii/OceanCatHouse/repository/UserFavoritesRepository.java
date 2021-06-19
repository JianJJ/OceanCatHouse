package tw.com.iii.OceanCatHouse.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import tw.com.iii.OceanCatHouse.model.UserFavoritesBean;

import java.util.List;

public interface UserFavoritesRepository extends JpaRepository<UserFavoritesBean, Integer> {

    @Query("from UserFavoritesBean f where f.userid=:userid and f.FavoriteCategory=:fc")
    List<UserFavoritesBean> findAllByUserIdAndCategory(Integer userid, String fc);

    @Query("from UserFavoritesBean f where f.userid=:userid")
    List<UserFavoritesBean> findAllByUserId(Integer userid);
}
