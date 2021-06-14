package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.RecipeCategoryBean;
import tw.com.iii.OceanCatHouse.repository.RecipeCategoryRepository;

import java.util.List;

@Service
@Transactional
public class RecipeCategoryService {

    @Autowired
    private RecipeCategoryRepository categoryRepositoryDao;

    public List<RecipeCategoryBean> list(){
        List<RecipeCategoryBean> categoryList = categoryRepositoryDao.findAll();
        return categoryList;
    }


}
