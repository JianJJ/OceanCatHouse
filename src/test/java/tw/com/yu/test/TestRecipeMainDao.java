package tw.com.yu.test;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.iii.OceanCatHouse.OceanCatHouseApplication;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeRepository;

@SpringBootTest(classes = OceanCatHouseApplication.class)
public class TestRecipeMainDao {
		
   @Autowired	
   RecipeRepository recipeDao;
   
   @Test
   void selectUser() {
	   
		//1. findByID根據ID查
//<<<<<<< HEAD
//		Optional<RecipeMainBean> optional = recipeDao.findById(21405);
//		RecipeMainBean recipe = optional.get();
//		String recipeName= recipe.getRecTitle();
//		System.out.println(recipeName);
//=======
//		Optional<RecipeBean> optional = recipeDao.findById(21405);
//		RecipeBean recipe = optional.get();
////		String recipeName= recipe.getRecTitle();
////		System.out.println(recipeName);
//>>>>>>> 9e55a90a5bfa7d157eba3ca2988bf88b8498ef48
		
		
//		//2.索引查詢
//		List<RecipeBean> recTexts = recipeDao.findAll(Sort.by("RecTitle"));
//		for(RecipeBean recText : recTexts) {
//			System.out.println(recText.getRecTitle());
//		}
//		
		

   }
	
	
	
}
