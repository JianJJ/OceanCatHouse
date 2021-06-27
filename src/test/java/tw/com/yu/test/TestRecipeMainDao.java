package tw.com.yu.test;




import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.iii.OceanCatHouse.OceanCatHouseApplication;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeMaterialBean;
import tw.com.iii.OceanCatHouse.model.UserFavoritesBean;
import tw.com.iii.OceanCatHouse.model.UserFavoritesCategoryBean;
import tw.com.iii.OceanCatHouse.repository.RecipeMaterialRepository;
import tw.com.iii.OceanCatHouse.repository.RecipeRepository;
import tw.com.iii.OceanCatHouse.repository.UserFavoritesCategoryRepository;
import tw.com.iii.OceanCatHouse.repository.UserFavoritesRepository;
import tw.com.iii.OceanCatHouse.repository.service.RecipeDetailService;

import javax.transaction.Transactional;
import java.util.List;

@SpringBootTest(classes = OceanCatHouseApplication.class)
public class TestRecipeMainDao {


   @Autowired
   RecipeDetailService service;

   @Autowired
   RecipeMaterialRepository recipeMaterialDao;

   @Autowired
   RecipeRepository recipeRepositoryDao;

   @Autowired
   UserFavoritesRepository userFavoritesDao;

   @Autowired
   UserFavoritesCategoryRepository userFavoritesCategoryDao;

   //    ID:379674


   @Test
   @Transactional
   public void testYu() {

      Integer x = userFavoritesDao.checkIfExists(21, 379015, "好吃");
      System.out.println(x);

   }

}
