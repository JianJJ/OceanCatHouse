package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.UserFavoritesCategoryBean;
import tw.com.iii.OceanCatHouse.repository.UserFavoritesCategoryRepository;
import tw.com.iii.OceanCatHouse.repository.UserFavoritesRepository;

import java.util.Optional;

@Service
@Transactional
public class UserFavoritesCategoryService {

    @Autowired
    private UserFavoritesCategoryRepository userFavoritesCategoryDao;

    @Autowired
    private UserFavoritesRepository userFavoritesDao;

    public void removerById(int ufcId, int userid) {
        Optional<UserFavoritesCategoryBean> byId = userFavoritesCategoryDao.findById(ufcId);
        String favoriteCategoryName = byId.get().getFavoriteCategoryName();
        userFavoritesDao.updateCategoryName("", userid, favoriteCategoryName);
        userFavoritesCategoryDao.deleteAllById(ufcId);
    }

}
