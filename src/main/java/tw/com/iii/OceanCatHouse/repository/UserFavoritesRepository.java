package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.UserFavoritesBean;

import java.util.List;

public interface UserFavoritesRepository extends JpaRepository<UserFavoritesBean, Integer> {

    @Query("from UserFavoritesBean f where f.userid=:userid and f.FavoriteCategoryName=:fc")
    List<UserFavoritesBean> findAllByUserIdAndCategory(Integer userid, String fc);

    @Query("select DISTINCT f.RecId from UserFavoritesBean f where f.userid=:userid")
    List<Integer> findAllByUserId(Integer userid);

    @Query(value="SELECT EXISTS(SELECT * FROM user_favorites WHERE userid = ?1 AND RecId = ?2 AND FavoriteCategoryName = ?3)",nativeQuery=true)
    Integer checkIfExists(Integer userid,Integer recId,String catName);


    @Transactional
    @Modifying
    @Query("update UserFavoritesBean set FavoriteCategoryName=:newName where userid=:userid and FavoriteCategoryName=:oldName")
    int updateCategoryName(String newName, Integer userid, String oldName);
}
