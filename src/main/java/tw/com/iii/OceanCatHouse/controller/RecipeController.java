/*
主題:食譜頁面Controller(食譜詳細頁面、食譜搜尋頁面)
 */

package tw.com.iii.OceanCatHouse.controller;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeMaterialBean;
import tw.com.iii.OceanCatHouse.model.RecipeStepBean;
import tw.com.iii.OceanCatHouse.repository.service.RecipeDetailService;

import java.util.List;


@Controller
public class RecipeController {

    @Autowired
    RecipeDetailService service;

    //1.食譜詳細頁面
    @RequestMapping(
            path = {"/recipeDetails"}

    )
    public ModelAndView recipeDetails(@RequestParam int id) {
        //設定食譜ID--------------------------------------------------------------------
//        int id = 374855;
        RecipeMainBean recipeData = service.getRecipeMainData(id);
        List<RecipeStepBean> recipeStepBean = service.getRecipeStepData(id);
        List<RecipeMaterialBean> recipeMaterialBean = service.getRecipeMaterialData(id);
        List<RecipeMainBean> recipeRecommendBean = service.getRecipeRecommend(id,5);

        ModelAndView mav = new ModelAndView();

//JSON標籤處理--------------------------------------------------
        JSONObject jsonObject = new JSONObject(recipeData.getRecTag());
        String key = jsonObject.keys().next();
        JSONArray jsonArray = jsonObject.getJSONArray(key);

        mav.addObject("jsonArray",jsonArray);

//傳入JSP，主要Bean-------------------------------------------------------
        mav.addObject("recMainBean",recipeData);
        mav.addObject("recStepBean",recipeStepBean);
        mav.addObject("recMatBean",recipeMaterialBean);
        mav.addObject("recReccBean",recipeRecommendBean);




//設定回傳試圖畫面路徑---------------------------------------------------
        mav.setViewName("views/RecipePages/recipeDetails");
        return mav;
    }


    //2.食譜搜尋頁面
    @RequestMapping(
            path = {"/recipeSearch"}
    )
    public ModelAndView recipeSearch() {
    //-------------------------------
       List<RecipeMainBean> recipeRecommendBean = service.getRecipeRecommend(0,9);
       ModelAndView mav = new ModelAndView();
       mav.addObject("recReccBean",recipeRecommendBean);



        mav.setViewName("views/RecipePages/recipeSearch");
        return mav;

    }


}
