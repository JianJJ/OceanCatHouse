package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import tw.com.iii.OceanCatHouse.model.RecipeStepBean;

import java.util.List;


public interface RecipeStepRepository extends JpaRepository<RecipeStepBean, Integer> {

    @Query(value = "select * from recipe_step where RecId = ?1", nativeQuery=true)
    List<RecipeStepBean> findByRecId(int RecId);

    @Query(value = "delete from RecipeStepBean where RecId = :recId")
    Integer deleteAllByRecId(Integer recId);
}
