package tw.com;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import tw.com.iii.OceanCatHouse.OceanCatHouseApplication;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeStepBean;
import tw.com.iii.OceanCatHouse.repository.RecipeMainRepository;
import tw.com.iii.OceanCatHouse.repository.RecipeStepRepository;

@SpringBootTest(classes = OceanCatHouseApplication.class)
public class jinaTest01 {

    @Autowired
    private RecipeStepRepository repositoryStepDao;
    @Autowired
    private RecipeMainRepository recipeMainDao;

    @Test
    public void insert(){
        RecipeMainBean rmb = new RecipeMainBean();
        rmb.setRecTitle("Apple");
        rmb.setCategoryId(3);

        RecipeStepBean sb = new RecipeStepBean();
        sb.setStep("33");
        sb.setStepPic("bee");

        RecipeStepBean sb2 = new RecipeStepBean();
        sb2.setStep("22");
        sb2.setStepPic("222");

//        sb.setRecipeMainBean(rmb);
        rmb.getRecipeStepBeans().add(sb);
//        rmb.getRecipeStepBeans().add(sb2);

        RecipeMainBean In = recipeMainDao.save(rmb);
        RecipeStepBean out = repositoryStepDao.save(sb);
        System.out.println(In);
        System.out.println(out);

    }
}
