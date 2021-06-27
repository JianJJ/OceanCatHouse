package tw.com.jian;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import tw.com.iii.OceanCatHouse.OceanCatHouseApplication;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.repository.RecipeMainRepository;
import tw.com.iii.OceanCatHouse.repository.RecipeMaterialRepository;
import tw.com.iii.OceanCatHouse.repository.service.RecipeMainService;

import java.util.List;

@SpringBootTest(classes = OceanCatHouseApplication.class)
public class test01 {

    @Autowired
    private RecipeMaterialRepository recipeMaterialRepository;

    @Test
    public void select(){



    }
}
