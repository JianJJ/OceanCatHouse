package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.repository.RecipeStepRepository;

@Service
@Transactional
public class RecipeStepService {

    @Autowired
    private RecipeStepRepository recipeStepDao;


}
