package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;


import java.util.List;

public interface RecipeRepository extends JpaRepository<RecipeMainBean,Integer>{

    @Query(value="SELECT * FROM recipe_main where RecId <> ?1 ORDER BY RAND() LIMIT ?2",nativeQuery=true)
    List<RecipeMainBean> findByRecIdNot(int id,int recNum);

}
