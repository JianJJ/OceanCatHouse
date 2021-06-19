package tw.com.iii.OceanCatHouse.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import tw.com.iii.OceanCatHouse.model.UserFavoritesCategoryBean;

import java.util.List;

public interface UserFavoritesCategoryRepository extends JpaRepository<UserFavoritesCategoryBean, Integer> {

    @Query("from UserFavoritesCategoryBean where userid = :userid")
    List<UserFavoritesCategoryBean> findAllByUserid(Integer userid);
}
