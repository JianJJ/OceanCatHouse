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

//    ID:21405
   @Test
   void selectUser() {

      RecipeMainBean recipeData = service.getRecipeMainData(351059);
      JSONObject jsonObject = new JSONObject(recipeData.getRecTag());
//      System.out.println(jsonObject.keySet());
//      jsonObject.length();

      String key = jsonObject.keys().next();
      System.out.println(key);
      JSONArray jsonArray = jsonObject.getJSONArray(key);
      System.out.println(jsonArray);
   }

}
