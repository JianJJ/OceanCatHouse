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

import java.util.List;
import java.util.Optional;

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



}
