package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeMaterialBean;
import tw.com.iii.OceanCatHouse.model.RecipeStepBean;

import java.util.List;

public interface RecipeMaterialRepository extends JpaRepository<RecipeMaterialBean, Integer> {

    @Query(value = "select * from recipe_material where RecId = ?1", nativeQuery=true)
    List<RecipeMaterialBean> findByRecId(int RecId);

    @Transactional
    @Modifying
    @Query(value = "delete from RecipeMaterialBean where RecId = :recId")
    RecipeMainBean deleteAllByRecId(Integer recId);
}
