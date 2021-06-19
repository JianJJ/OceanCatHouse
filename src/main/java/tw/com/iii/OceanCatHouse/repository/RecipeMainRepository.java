package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;

import java.util.List;

public interface RecipeMainRepository extends JpaRepository<RecipeMainBean, Integer> {

    @Query("select count(m) from RecipeMainBean m where m.UserId = :userId")
    Integer recCount(@Param("userId") Integer userId);

    @Query("from RecipeMainBean where UserId = :userId")
    List<RecipeMainBean> findAllByUserid(@Param("userId") Integer userid);

    @Transactional
    @Modifying
    @Query(value = "delete from RecipeMainBean where RecId = :recId")
    Integer deleteAllByRecId(Integer recId);

}
