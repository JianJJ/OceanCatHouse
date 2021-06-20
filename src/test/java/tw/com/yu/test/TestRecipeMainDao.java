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
      String keyWord = "義大 利麵";
      String keyWord1 = "大麵利義";
      List<RecipeMainBean> searchResultMain = service.getSearchResultMain(keyWord);

      String[] splitWord = keyWord.split(" ");
      String conbin = "";

      if(!keyWord.equals("")){
         for (int i = 0; i < splitWord.length; i++) {
            conbin = conbin + splitWord[i] + "%";
            System.out.println(conbin);
         }
         conbin = conbin.substring(0,conbin.length()-1);
         System.out.println(conbin);
      }else {
         System.out.println("空:" + keyWord);
      }







   }

}
