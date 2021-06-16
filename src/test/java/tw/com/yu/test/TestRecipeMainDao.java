package tw.com.yu.test;

import java.util.List;
import java.util.Optional;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.iii.OceanCatHouse.OceanCatHouseApplication;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeStepBean;
import tw.com.iii.OceanCatHouse.repository.RecipeRepository;
import tw.com.iii.OceanCatHouse.repository.RecipeStepRepository;
import tw.com.iii.OceanCatHouse.repository.service.RecipeDetailService;

@SpringBootTest(classes = OceanCatHouseApplication.class)
public class TestRecipeMainDao {
		


   @Autowired
   RecipeDetailService service;

//    findById(21405);
   @Test
   void selectUser() {
	   
       //1. findByID根據ID查
       RecipeMainBean recipeData = service.getRecipeMainData(21405);
       String recTag = recipeData.getRecTag();
       System.out.println(recTag);
       JSONObject jsonObject = new JSONObject(recTag);
       JSONArray array = jsonObject.getJSONArray("RecTag");
       System.out.println(array.length());
       System.out.println(array.get(0));





//       List<RecipeStepBean> recipeStepBean = service.getRecipeStepData(21405);
//       System.out.println("取得步驟長度:" + recipeStepBean.size());

//       String step = recipeStepList.get(1).getStepText();
//       System.out.println(step);
		
//		//2.索引查詢
//		List<RecipeBean> recTexts = recipeDao.findAll(Sort.by("RecTitle"));
//		for(RecipeBean recText : recTexts) {
//			System.out.println(recText.getRecTitle());
//		}
//		
		

   }
	
	
	
}
