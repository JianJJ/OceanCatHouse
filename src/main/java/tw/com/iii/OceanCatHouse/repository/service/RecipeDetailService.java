package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeMaterialBean;
import tw.com.iii.OceanCatHouse.model.RecipeStepBean;
import tw.com.iii.OceanCatHouse.repository.RecipeMaterialRepository;
import tw.com.iii.OceanCatHouse.repository.RecipeRepository;
import tw.com.iii.OceanCatHouse.repository.RecipeStepRepository;

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


   //1.訪問recipe_main，取得返回Bean
    public RecipeMainBean getRecipeMainData(int id){
        Optional<RecipeMainBean> ob = recipeMainDao.findById(id);
        RecipeMainBean recipeData=ob.get();
        return recipeData;
    }

    //2.訪問recipe_step，取得返回Bean(使用自定義查詢findByRecId)
    public List<RecipeStepBean> getRecipeStepData(int recID){
        List<RecipeStepBean> stepBean = recipeStepDao.findByRecId(recID);
        return stepBean;
    }

    //3.訪問recipe_material，取得返回Bean(使用自定義查詢findByRecId)
    public List<RecipeMaterialBean> getRecipeMaterialData(int recID){
        List<RecipeMaterialBean> matBean = recipeMatDao.findByRecId(recID);
        return matBean;
    }

    //4.推薦系統
    public List<RecipeMainBean> getRecipeRecommend(int id,int recNum){
        List<RecipeMainBean> recomBean = recipeMainDao.findByRecIdNot(id,recNum);
        return recomBean;
    }

    //5.搜尋系統01(以'食譜標題'搜尋)
    public List<RecipeMainBean> getSearchResult(String searchString){
        List<RecipeMainBean> searchBean = recipeMainDao.findByRecTitleContains(searchString);
        return searchBean;
    }

    //6.搜尋系統02(以'食材名稱'搜尋)
    public List<Integer> getSearchResultMat(String searchString){
        Set<Integer> recIdSet = new HashSet<>();
        List<Integer> recIdlist = new ArrayList<>();

        List<RecipeMaterialBean> beans = recipeMatDao.findByMaterialNameContains(searchString);
        for(RecipeMaterialBean bean : beans){
           recIdSet.add(bean.getRecId());
        }
        recIdlist.addAll(recIdSet);

        return recIdlist;
    }

}
