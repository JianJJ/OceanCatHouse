package tw.com.jian;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.aggregator.AggregateWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.OceanCatHouseApplication;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.model.UserFavoritesBean;
import tw.com.iii.OceanCatHouse.repository.RecipeMainRepository;
import tw.com.iii.OceanCatHouse.repository.UserFavoritesRepository;
import tw.com.iii.OceanCatHouse.repository.UserRepository;
import tw.com.iii.OceanCatHouse.repository.service.RecipeMainService;

import java.util.List;
import java.util.Optional;

@SpringBootTest(classes = OceanCatHouseApplication.class)
@Transactional
public class favoritesTest01 {

    @Autowired
    private UserFavoritesRepository userFavoritesDao;

    @Autowired
    private UserRepository userDao;

    @Autowired
    private RecipeMainRepository recipeMainDao;

    @Autowired
    private RecipeMainService recipeMainService;

    @Test
    public void insert() {
//        List<UserFavoritesBean> allByIdAndCategory = (List<UserFavoritesBean>) userDao.findAllByIdAndCategory(21, "1");
//        for(UserFavoritesBean userFavoritesBean:allByIdAndCategory){
//            System.out.println(userFavoritesBean.getRecId());

        List<RecipeMainBean> allByFavorites = recipeMainService.findFavoritesByCategory(21, "1");
        for (RecipeMainBean mainBean : allByFavorites) {
            System.out.println(mainBean);
        }
//        UserFavoritesBean fb = new UserFavoritesBean();
//        fb.setUserid(21);
//        fb.setRecId(123);

//        Optional<UserBean> byId1 = userDao.findById(21);
//        UserBean userBean = byId1.get();
//        List<UserFavoritesBean> userFavoritesBeans = userBean.getUserFavoritesBeans();
//        for(UserFavoritesBean apple:userFavoritesBeans){
//            System.out.println(apple);
    }
//        Optional<UserFavoritesBean> byId = userFavoritesDao.findById(12);
//        UserFavoritesBean userFavoritesBean = byId.get();
//        System.out.println(userFavoritesBean);


}
