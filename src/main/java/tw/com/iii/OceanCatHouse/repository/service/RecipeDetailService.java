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
    public List<RecipeMainBean> getSearchResultMain(String searchString){
        //關鍵字處理，拆分，合併:
        String[] splitWord = searchString.split("");
        String conbin = "";
        if (!searchString.equals("")) {
            for (int i = 0; i < splitWord.length; i++) {
                conbin = conbin + splitWord[i] + "%";
            }
            conbin = conbin.substring(0, conbin.length() - 1);
        }

        List<RecipeMainBean> searchBean = recipeMainDao.findByRecTitleContains(conbin);




        return searchBean;
    }

    //6.搜尋系統02(以'食材名稱'搜尋)
    public List<RecipeMainBean> getSearchResultMat(String searchString){
        //關鍵字處理，拆分，合併:
        String[] splitWord = searchString.split(" ");
        String conbin = "";
        if (!searchString.equals("")) {
            for (int i = 0; i < splitWord.length; i++) {
                conbin = conbin + splitWord[i] + "%";
            }
            conbin = conbin.substring(0, conbin.length() - 1);
        }


        Set<Integer> beans = recipeMatDao.findByMaterialNameContains(conbin);
        List<RecipeMainBean> recipeMainBeans = new ArrayList<>();

        for(int recId : beans){
            recipeMainBeans.add(getRecipeMainData(recId));
        }

        return recipeMainBeans;
    }

    //7.結合關鍵字與食材查詢
    public List<RecipeMainBean> getSearchResultKeyAndMat(String searchKeyString,String searchMatString){
        //關鍵字處理，拆分，合併(關鍵字):
        String[] splitWord = searchKeyString.split("");
        String conbinsearchKey = "";
        if (!searchKeyString.equals("")) {
            for (int i = 0; i < splitWord.length; i++) {
                conbinsearchKey = conbinsearchKey + splitWord[i] + "%";
            }
            conbinsearchKey = conbinsearchKey.substring(0, conbinsearchKey.length() - 1);
        }
        //關鍵字處理，拆分，合併(食材):
        String[] splitWord2 = searchMatString.split(" ");
        String conbinsearchMat = "";
        if (!searchMatString.equals("")) {
            for (int i = 0; i < splitWord2.length; i++) {
                conbinsearchMat = conbinsearchMat + splitWord2[i] + "%";
            }
            conbinsearchMat = conbinsearchMat.substring(0,conbinsearchMat.length()-1);
        }

        List<RecipeMainBean> recipeMainBeans = new ArrayList<>();
        Set<Integer> recIdSet = recipeMainDao.findByRecTitleAndRecipeMaterialName(conbinsearchKey, conbinsearchMat);
        for(int recId : recIdSet){
            recipeMainBeans.add(getRecipeMainData(recId));
        }

        return recipeMainBeans;
    }
}
