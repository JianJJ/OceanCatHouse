package tw.com.jian;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.OceanCatHouseApplication;
import tw.com.iii.OceanCatHouse.model.UserFavoritesBean;
import tw.com.iii.OceanCatHouse.repository.UserFavoritesRepository;

import java.util.Optional;

@SpringBootTest(classes = OceanCatHouseApplication.class)
public class favoritesTest01 {

    @Autowired
    private UserFavoritesRepository userFavoritesDao;

    @Test
    public void insert(){
        UserFavoritesBean fb = new UserFavoritesBean();
        fb.setUserid(21);
        fb.setRecId(123);

        Optional<UserFavoritesBean> byId = userFavoritesDao.findById(12);
        UserFavoritesBean userFavoritesBean = byId.get();
        System.out.println(userFavoritesBean);


    }
}
