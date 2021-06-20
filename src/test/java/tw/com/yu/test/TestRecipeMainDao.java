package tw.com.yu.test;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.iii.OceanCatHouse.OceanCatHouseApplication;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeMaterialBean;
import tw.com.iii.OceanCatHouse.repository.RecipeMaterialRepository;
import tw.com.iii.OceanCatHouse.repository.service.RecipeDetailService;

import javax.transaction.Transactional;

@SpringBootTest(classes = OceanCatHouseApplication.class)
public class TestRecipeMainDao {


   @Autowired
   RecipeDetailService service;

   @Autowired
   RecipeMaterialRepository recipeMaterialDao;

   //    ID:379674


   @Test
   @Transactional
   void testYu() {
       String keyWord = "麵";
       List<RecipeMainBean> recipeMainBeans = service.getSearchResultMat(keyWord);
       System.out.println("搜尋到的食譜數量:" + recipeMainBeans.size());
       for(RecipeMainBean bean : recipeMainBeans){
           System.out.println(bean);
       }
       System.out.println("搜尋到的食譜數量:" + recipeMainBeans.size());
   }
}
