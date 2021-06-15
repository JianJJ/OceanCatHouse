package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iii.OceanCatHouse.model.RecipeMainBean;

public interface RecipeRepository extends JpaRepository<RecipeMainBean,Integer>{

	
}
