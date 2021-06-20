package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.UserFavoritesBean;
import tw.com.iii.OceanCatHouse.repository.UserFavoritesRepository;

@Service
@Transactional
public class UserFavoritesService {

    @Autowired
    private UserFavoritesRepository userFavoritesDao;

}
