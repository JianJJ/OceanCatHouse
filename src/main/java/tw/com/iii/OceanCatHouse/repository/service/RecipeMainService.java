package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.repository.RecipeMainRepository;

@Service
@Transactional
public class RecipeMainService {

    @Autowired
    private RecipeMainRepository recipeMainDao;

    public RecipeMainBean insert(RecipeMainBean recipeMainBean){
        RecipeMainBean save = recipeMainDao.save(recipeMainBean);
        return save;
    }


}
