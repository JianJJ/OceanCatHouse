/*
主題:食譜頁面Controller(食譜詳細頁面、食譜搜尋頁面)
 */

package tw.com.iii.OceanCatHouse.controller;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeStepBean;
import tw.com.iii.OceanCatHouse.repository.service.RecipeDetailService;

import java.util.List;


@Controller
public class RecipeController {

    @Autowired
    RecipeDetailService service;

    //食譜詳細頁面
    @RequestMapping(
            path = {"/recipeDetails"}

    )
    public ModelAndView recipeDetails() {
        //設定食譜ID--------------------------------------------------------------------
        RecipeMainBean recipeData = service.getRecipeMainData(374855);
        List<RecipeStepBean> recipeStepBean = service.getRecipeStepData(374855);
        ModelAndView mav = new ModelAndView();
//From recipe_main-------------------------------------------------------------------
        String Title = recipeData.getRecTitle();
        String picURL = recipeData.getRecPic();
        String recText = recipeData.getRecText();
        int recTime = recipeData.getRecTime();
        int recNum = recipeData.getRecNum();
//JSON標籤--------------------------------------------------
        JSONObject jsonObject = new JSONObject(recipeData.getRecTag());
        JSONArray jsonArray = jsonObject.getJSONArray("RecTag");
        int jsonLenth = jsonArray.length();




//From recipe_step------------------------------------------------------------------
        int recipeStepCount = recipeStepBean.size();



//傳入JSP-------------------------------------------------------
        mav.addObject("recMainBean",recipeData);
        mav.addObject("recTitle",Title);
        mav.addObject("recPic",picURL);
        mav.addObject("recText",recText);
        mav.addObject("recTime",recTime);
        mav.addObject("recNum",recNum);
        mav.addObject("jsonLen",jsonLenth);
        mav.addObject("jsonArray",jsonArray);

        mav.addObject("recStepCount",recipeStepCount);
        mav.addObject("recStepBean",recipeStepBean);

//設定回傳試圖畫面路徑---------------------------------------------------
        mav.setViewName("views/RecipePages/recipeDetails");
        return mav;
    }
}
