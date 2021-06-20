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
import tw.com.iii.OceanCatHouse.repository.RecipeRepository;
import tw.com.iii.OceanCatHouse.repository.service.RecipeDetailService;

import javax.transaction.Transactional;

@SpringBootTest(classes = OceanCatHouseApplication.class)
public class TestRecipeMainDao {


   @Autowired
   RecipeDetailService service;

   @Autowired
   RecipeMaterialRepository recipeMaterialDao;

   @Autowired
   RecipeRepository recipeRepositoryDao;

   //    ID:379674


   @Test
   @Transactional
   void testYu() {

      List<RecipeMainBean> recipeMainBeans = new ArrayList<>();

      Set<Integer> beans = recipeRepositoryDao.findByRecTitleAndRecipeMaterialName("麵", "水");
      for(int recId : beans){
         recipeMainBeans.add(service.getRecipeMainData(recId));
      }
      System.out.println(recipeMainBeans.size());
      System.out.println(recipeMainBeans.get(0));
   }
}
