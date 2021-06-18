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
   void testYu() {
       String searchString = "麵";
       List<RecipeMainBean> searchResultBean = service.getSearchResult(searchString);
       System.out.println("總共搜尋到:" + searchResultBean.size());
       System.out.println(searchResultBean.get(1).getRecTitle() + searchResultBean.get(1).getRecTag());





  }
}
