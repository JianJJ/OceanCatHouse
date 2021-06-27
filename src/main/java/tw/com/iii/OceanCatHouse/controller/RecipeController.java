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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import tw.com.iii.OceanCatHouse.model.*;
import tw.com.iii.OceanCatHouse.repository.UserFavoritesCategoryRepository;
import tw.com.iii.OceanCatHouse.repository.UserFavoritesRepository;
import tw.com.iii.OceanCatHouse.repository.service.RecipeDetailService;
import tw.com.iii.OceanCatHouse.repository.service.RecipeMainService;
import tw.com.iii.OceanCatHouse.repository.service.UserFavoritesCategoryService;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class RecipeController {

    @Autowired
    private RecipeDetailService service;

    @Autowired
    private RecipeMainService recipeMainService;

    @Autowired
    private UserFavoritesRepository userFavoritesDao;

    @Autowired
    private UserFavoritesCategoryRepository userFavoritesCategoryDao;




    //1.食譜詳細頁面
    @RequestMapping(
            path = {"/recipeDetails"}

    )
    @ResponseBody
    public ModelAndView recipeDetails(@RequestParam(required = false) Integer id, Integer[] favId,HttpSession session) {
        //設定食譜ID--------------------------------------------------------------------
//        int id = 374855;
        RecipeMainBean recipeData = service.getRecipeMainData(id);
        List<RecipeStepBean> recipeStepBean = service.getRecipeStepData(id);
        List<RecipeMaterialBean> recipeMaterialBean = service.getRecipeMaterialData(id);
        List<RecipeMainBean> recipeRecommendBean = service.getRecipeRecommend(id,5);

        ModelAndView mav = new ModelAndView();

//Rectag切割轉成Array-----------------------------------------------------
      String[] recTags = recipeData.getRecTag().split("、");
      int recTagLen = recTags.length;

      mav.addObject("recTag",recTags);
      mav.addObject("recTagLen",recTagLen);
//食譜收藏功能相關----------------------------------------------------------

        UserBean user = (UserBean) session.getAttribute("user");
        if( user != null){
            System.out.println("使用者成功登入，userID:" + user.getUserid());
            List<RecipeMainBean> mainList = recipeMainService.findFavoritesByUserId(user.getUserid());
            List<UserFavoritesCategoryBean> UFCBList = userFavoritesCategoryDao.findAllByUserid(user.getUserid());
            mav.addObject("mainBeanList", mainList);
            mav.addObject("UFCBList", UFCBList);

            if(favId != null){
                for(Integer x : favId){
                    System.out.println("接收參數:" + x);
                    service.addFavorite(user.getUserid(),recipeData.getRecId(),userFavoritesCategoryDao.findByFavoritesCategoryId(x).getFavoriteCategoryName());
                }
            }
        }else {
            System.out.println("使用者未登入");
        }













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
    public ModelAndView recipeSearch(@RequestParam(name = "searchString", required = false, defaultValue = "recommend") String searchString,
                                     @RequestParam(name = "searchMatString", required = false, defaultValue = "recommend") String searchMatString) {

        List<RecipeMainBean> recipeRecommendBean = service.getRecipeRecommend(0, 9);
        List<RecipeMainBean> SearchKeyWordResult = service.getSearchResultMain(searchString);
        List<RecipeMainBean> searchMatResult = service.getSearchResultMat(searchMatString);
        List<RecipeMainBean> searchKeyAndMatResult = service.getSearchResultKeyAndMat(searchString, searchMatString);

        ModelAndView mav = new ModelAndView();
        String searchResultText = "";

        mav.addObject("searchString", searchString);
        mav.addObject("searchMatString", searchMatString);

        //條件判斷參數決定傳入VIEW的搜尋結果(Bean)與文字-------------------------------
        if (searchString.equals("recommend") && searchMatString.equals("recommend")) {
            //01.關鍵字搜尋為空，依食材搜尋也為空，呈現推薦系統結果給使用者。
            mav.addObject("recResultBean", recipeRecommendBean);
            searchResultText = "歡迎光臨海貓食屋，以下是為您推薦的食譜";
        } else if (!searchString.equals("recommend") && searchMatString.equals("recommend")) {
            //02.關鍵字搜尋不為空，食材搜尋也為空，呈現關鍵字搜尋結果給使用者。
            mav.addObject("recResultBean", SearchKeyWordResult);
            searchResultText = String.format("搜尋關鍵字: %s<br>共找到%d筆結果", searchString, SearchKeyWordResult.size());

        } else if (searchString.equals("recommend") && !searchMatString.equals("recommend")) {
            //03.關鍵字搜尋為空，食材搜尋不為空，呈現依食材搜尋結果給使用者。
            mav.addObject("recResultBean", searchMatResult);
            searchResultText = String.format("搜尋食材: %s<br>共找到%d筆結果", searchMatString, searchMatResult.size());
        } else if (!searchString.equals("recommend") && !searchMatString.equals("recommend")) {
            //04.關鍵字搜尋不為空，食材搜尋不為空，呈現兩者搜尋結果給使用者。
            mav.addObject("recResultBean", searchKeyAndMatResult);
            searchResultText = String.format("搜尋: %s &nbsp;&nbsp; 食材: %s<br>共找到%d筆結果", searchString, searchMatString, searchKeyAndMatResult.size());

        }
        mav.addObject("searchResultText", searchResultText);
        //--------------------------------------

        mav.setViewName("views/RecipePages/recipeSearch");
        return mav;

    }


    //3.食譜主頁
    @RequestMapping(
            path = {"/recipeHome"}
    )
    public ModelAndView recipeHome() {

        List<RecipeMainBean> recipeRecommendBean = service.getRecipeRecommend(0, 5);
        ModelAndView mav = new ModelAndView();
        mav.addObject("recReccBean", recipeRecommendBean);


        mav.setViewName("views/RecipePages/recipeHome");
        return mav;

    }




}
