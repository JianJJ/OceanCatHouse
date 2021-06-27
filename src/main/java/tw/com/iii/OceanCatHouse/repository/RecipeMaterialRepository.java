package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeMaterialBean;
import tw.com.iii.OceanCatHouse.model.RecipeStepBean;

import java.util.List;
import java.util.Set;

public interface RecipeMaterialRepository extends JpaRepository<RecipeMaterialBean, Integer> {

    @Query(value = "select * from recipe_material where RecId = ?1", nativeQuery=true)
    List<RecipeMaterialBean> findByRecId(int RecId);

    @Query(value = "select RecId from recipe_material where MaterialName like %?1%", nativeQuery=true)
    Set<Integer> findByMaterialNameContains(String keyWord);

//    @Query(value ="select DISTINCT RecId from recipe_material where MaterialName like %?1%", nativeQuery=true )
//    Set<Integer> findRecId(String MaterialName );

    @Query(value ="select DISTINCT RecId from RecipeMaterialBean where MaterialName like %?1%", nativeQuery=false )
    Page<Integer> findRecId(String MaterialName , Pageable pageable);

    @Transactional
    @Modifying
    @Query(value = "delete from RecipeMaterialBean where RecId = :recId")
    Integer deleteAllByRecId(Integer recId);

}
