package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;

import java.util.List;

public interface RecipeMainRepository extends JpaRepository<RecipeMainBean, Integer> {

    @Query("select count(m) from RecipeMainBean m where m.UserId = :userId")
    Integer recCount(@Param("userId") Integer userId);

    @Query("from RecipeMainBean where UserId = :userId")
    List<RecipeMainBean> findAllByUserid(@Param("userId") Integer userid);
}
