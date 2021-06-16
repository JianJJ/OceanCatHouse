package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeStepBean;
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


    List<String> recipePicURL = null;
    List<String> recipeText = null;


    public RecipeMainBean getRecipeMainData(int id){
        Optional<RecipeMainBean> ob = recipeMainDao.findById(id);
        RecipeMainBean recipeData=ob.get();
        return recipeData;
    }


    public List<RecipeStepBean> getRecipeStepData(int recID){
        List<RecipeStepBean> stepBean = recipeStepDao.findByRecId(recID);

//        int recipeStepCount = stepBean.size();
//        for(int i = 0;i < recipeStepCount;i++){
//            recipePicURL.add(stepBean.get(i).getStepPic());
//            recipeText.add(stepBean.get(i).getStepText());
//        }

        return stepBean;

    }




}
