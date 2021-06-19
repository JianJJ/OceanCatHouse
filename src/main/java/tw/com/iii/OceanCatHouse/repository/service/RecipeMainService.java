package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.UserFavoritesBean;
import tw.com.iii.OceanCatHouse.repository.RecipeMainRepository;
import tw.com.iii.OceanCatHouse.repository.UserFavoritesRepository;
import tw.com.iii.OceanCatHouse.repository.UserRepository;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;


@Service
@Transactional
public class RecipeMainService {

    @Autowired
    private RecipeMainRepository recipeMainDao;

    @Autowired
    private UserRepository userDao;

    @Autowired
    private UserFavoritesRepository userFavoritesDao;

    public RecipeMainBean insert(RecipeMainBean recipeMainBean){
        RecipeMainBean save = recipeMainDao.save(recipeMainBean);
        return save;
    }

    // 查詢收藏食譜(依照分類)
    public List<RecipeMainBean> findFavoritesByCategory(Integer userid, String FC){
        List<RecipeMainBean> recipeMainBeanList = new LinkedList<>();
        List<UserFavoritesBean> userFavoritesBeans = userFavoritesDao.findAllByUserIdAndCategory(userid, FC);
        for (UserFavoritesBean favorites: userFavoritesBeans){
            Optional<RecipeMainBean> byId = recipeMainDao.findById(favorites.getRecId());
            RecipeMainBean recipeMainBean = byId.get();
            recipeMainBeanList.add(recipeMainBean);
        }
        return recipeMainBeanList;
    }

    // 查詢收藏食譜(全部)
    public List<RecipeMainBean> findFavoritesByUserId(Integer userid){
        List<RecipeMainBean> recipeMainBeanList = new LinkedList<>();
        List<UserFavoritesBean> userFavoritesBeans = userFavoritesDao.findAllByUserId(userid);
        if(userFavoritesBeans != null){
            for (UserFavoritesBean favorites: userFavoritesBeans){
                if(favorites != null && favorites.getRecId() != null){
                    Optional<RecipeMainBean> byId = recipeMainDao.findById(favorites.getRecId());
                    if(byId != null){
                        RecipeMainBean recipeMainBean = byId.get();
                        recipeMainBeanList.add(recipeMainBean);
                    }
                }
            }
        }

        return recipeMainBeanList;
    }

}
