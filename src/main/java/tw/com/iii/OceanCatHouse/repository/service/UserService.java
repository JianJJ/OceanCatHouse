package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.repository.UserRepository;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository UserDao;

    public UserBean update(UserBean userBean){
        UserBean save = UserDao.save(userBean);
        return save;
    }
}
