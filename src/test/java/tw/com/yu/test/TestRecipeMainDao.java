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

@SpringBootTest(classes = OceanCatHouseApplication.class)
public class TestRecipeMainDao {


   @Autowired
   RecipeDetailService service;

   @Autowired
   RecipeMaterialRepository recipeMaterialDao;

   //    ID:21405


   @Test
   void testYu() {
       List<RecipeMaterialBean> beans = recipeMaterialDao.findByRecId(378439);
       System.out.println(beans.size());
       List<RecipeMaterialBean> beans2 = recipeMaterialDao.findByMaterialNameContains("水");
       System.out.println(beans2.size());

       Set<Integer> recIdSet = new HashSet<>();
       List<Integer> list = new ArrayList<>();

       for(RecipeMaterialBean bean : beans2){
//           System.out.printf("食材RecId:%d 食材:%s\n",bean.getRecId(),bean.getMaterialName());
           recIdSet.add(bean.getRecId());
       }

       list.addAll(recIdSet);
       System.out.printf("List數量:%d",list.size());
//       for (int i :list){
//           System.out.println(i);
//       }





   }
}
