package tw.com.yu.test;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.iii.OceanCatHouse.OceanCatHouseApplication;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.repository.service.RecipeDetailService;

@SpringBootTest(classes = OceanCatHouseApplication.class)
public class TestRecipeMainDao {


   @Autowired
   RecipeDetailService service;

   //    ID:21405


   @Test
   void selectUser() {
//      List<RecipeMainBean> recipeRecommendBean = service.getRecipeRecommend(0, 6);
//      List<List> tagList = new ArrayList<>();
//
//
//      for(int i = 0;i<6;i++){
//         JSONObject jsonObject = new JSONObject(recipeRecommendBean.get(i).getRecTag());
//         String key = jsonObject.keys().next();
//         JSONArray jsonArray = jsonObject.getJSONArray(key);
//         List list = jsonArray.toList();
//         tagList.add(list);
//      }
//
//      System.out.println(tagList);
//
//      System.out.println(tagList.get(1).get(0));
//
//
//
//
//
//
//
//
//
//      List<JSONArray> jsonArrayList ;
//
//
//
//

//      for(int i = 0;i<6;i++){
//         jsonObject = new JSONObject(recipeRecommendBean.get(i).getRecTag());
//         for(int j = 0;j<6;j++){
//
//         String key = jsonObject.keys().next();
//         JSONArray jsonArray = jsonObject.getJSONArray(key);
//         System.out.println(jsonArray.get(i));
//      }




//      JSONArray jsonArray = null;
//      List<JSONArray> tagArray = null;
//      for (int i = 0; i < 6; i++) {
//         JSONObject jsonObject = new JSONObject(recipeRecommendBean.get(i).getRecTag());
//         String key = jsonObject.keys().next();
//         jsonArray = jsonObject.getJSONArray(key);
//         tagArray.add(jsonArray);
//      }

//   }
}
}
