package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;


import java.util.List;
import java.util.Set;

public interface RecipeRepository extends JpaRepository<RecipeMainBean,Integer>{

    @Query(value="SELECT * FROM recipe_main where RecId <> ?1 ORDER BY RAND() LIMIT ?2",nativeQuery=true)
    List<RecipeMainBean> findByRecIdNot(int id,int recNum);


    @Query(value="SELECT * FROM recipe_main where RecTitle like %?1%",nativeQuery=true)
    List<RecipeMainBean> findByRecTitleContains(String searchString);

    @Query(value="SELECT main.RecId FROM recipe_main main join recipe_material mat on main.RecId = mat.RecId where main.RecTitle like %?1% AND mat.MaterialName like %?2%",nativeQuery=true)
    Set<Integer> findByRecTitleAndRecipeMaterialName(String searchMainString, String searchMatString);
}
