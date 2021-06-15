package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tw.com.iii.OceanCatHouse.model.RecipeStepBean;

public interface RecipeStepRepository extends JpaRepository<RecipeStepBean, Integer> {
}
