package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeMaterialBean;
import tw.com.iii.OceanCatHouse.model.RecipeStepBean;
import tw.com.iii.OceanCatHouse.model.UserFavoritesBean;
import tw.com.iii.OceanCatHouse.repository.*;

import java.util.*;

@Service
@Transactional
public class RecipeDetailService {

    @Autowired
    private RecipeRepository recipeMainDao;

    @Autowired
    private RecipeStepRepository recipeStepDao;

    @Autowired
    private RecipeMaterialRepository recipeMatDao;

    @Autowired
    private UserFavoritesRepository userFavoritesDao;

    @Autowired
    private UserFavoritesCategoryRepository userFavoritesCategoryDao;

    //1.訪問recipe_main，取得返回Bean
    public RecipeMainBean getRecipeMainData(int id) {
        Optional<RecipeMainBean> ob = recipeMainDao.findById(id);
        RecipeMainBean recipeData = ob.get();
        return recipeData;
    }

    //2.訪問recipe_step，取得返回Bean(使用自定義查詢findByRecId)
    public List<RecipeStepBean> getRecipeStepData(int recID) {
        List<RecipeStepBean> stepBean = recipeStepDao.findByRecId(recID);
        return stepBean;
    }

    //3.訪問recipe_material，取得返回Bean(使用自定義查詢findByRecId)
    public List<RecipeMaterialBean> getRecipeMaterialData(int recID) {
        List<RecipeMaterialBean> matBean = recipeMatDao.findByRecId(recID);
        return matBean;
    }

    //4.推薦系統
    public List<RecipeMainBean> getRecipeRecommend(int id, int recNum) {
        List<RecipeMainBean> recomBean = recipeMainDao.findByRecIdNot(id, recNum);
        return recomBean;
    }

    //5.搜尋系統01(以'食譜標題'搜尋)
    public List<RecipeMainBean> getSearchResultMain(String searchString) {
        //關鍵字處理，拆分，合併(關鍵字):
        String conbinsearchKey = searchKeyWordProcess(searchString);

        List<RecipeMainBean> searchBean = recipeMainDao.findByRecTitleContains(conbinsearchKey);
        return searchBean;
    }

    //6.搜尋系統02(以'食材名稱'搜尋)
    public List<RecipeMainBean> getSearchResultMat(String searchString) {
        //關鍵字處理，拆分，合併(食材):
        String conbinsearchMat = searchMatKeyWordProcess(searchString);

        Set<Integer> beans = recipeMatDao.findByMaterialNameContains(conbinsearchMat);
        List<RecipeMainBean> recipeMainBeans = new ArrayList<>();

        for (int recId : beans) {
            recipeMainBeans.add(getRecipeMainData(recId));
        }
        return recipeMainBeans;
    }

    //7.結合關鍵字與食材查詢
    public List<RecipeMainBean> getSearchResultKeyAndMat(String searchKeyString, String searchMatString) {
        //關鍵字處理，拆分，合併(關鍵字):
         String conbinsearchKey = searchKeyWordProcess(searchKeyString);
        //關鍵字處理，拆分，合併(食材):
         String conbinsearchMat = searchMatKeyWordProcess(searchMatString);

        List<RecipeMainBean> recipeMainBeans = new ArrayList<>();
        Set<Integer> recIdSet = recipeMainDao.findByRecTitleAndRecipeMaterialName(conbinsearchKey, conbinsearchMat);
        for (int recId : recIdSet) {
            recipeMainBeans.add(getRecipeMainData(recId));
        }

        return recipeMainBeans;
    }

    //8.關鍵字處理工廠(關鍵字)
    public String searchKeyWordProcess(String searchkeyWord) {
        //關鍵字處理，拆分，合併(關鍵字):
        String[] splitWord = searchkeyWord.split("");
        String newKeyWord = "";
        if (!searchkeyWord.equals("")) {
            for (int i = 0; i < splitWord.length; i++) {
                newKeyWord = newKeyWord + splitWord[i] + "%";
            }
            newKeyWord = newKeyWord.substring(0,newKeyWord.length() - 1);
        }
        return newKeyWord;
    }

    //9.關鍵字處理工廠(食材關鍵字)
    public String searchMatKeyWordProcess(String searchkeyWord) {
        //關鍵字處理，拆分，合併(食材名稱):
        String[] splitWord = searchkeyWord.split(" ");
        String newKeyWord = "";
        if (!searchkeyWord.equals("")) {
            for (int i = 0; i < splitWord.length; i++) {
                newKeyWord = newKeyWord + splitWord[i] + "%";
            }
            newKeyWord = newKeyWord.substring(0,newKeyWord.length() - 1);
        }
        return newKeyWord;
    }

    //10.加入收藏資料庫操作
    public void addFavorite(int userID,int recId,String catName){

            Integer checkIfExistsNum = userFavoritesDao.checkIfExists(userID, recId, catName);

            if(checkIfExistsNum.equals(0)){
                UserFavoritesBean userFavoritesBean = new UserFavoritesBean();
                userFavoritesBean.setUserid(userID);
                userFavoritesBean.setRecId(recId);
                userFavoritesBean.setFavoriteCategoryName(catName);
                userFavoritesDao.save(userFavoritesBean);
                System.out.printf("成功新增食譜:%d 到收藏夾:%s !%n",recId,catName);
            }else{
                System.out.println("食譜已存在收藏夾中!");
            }












    }


}
