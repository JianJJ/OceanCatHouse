package tw.com.jian;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.OceanCatHouseApplication;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeStepBean;
import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.repository.RecipeMainRepository;
import tw.com.iii.OceanCatHouse.repository.RecipeStepRepository;

import java.util.List;

@SpringBootTest(classes = OceanCatHouseApplication.class)
@Transactional
public class jinaTest01 {

    @Autowired
    private RecipeStepRepository repositoryStepDao;
    @Autowired
    private RecipeMainRepository recipeMainDao;

    @Test
//    @Transactional
    public void insert(){
        RecipeMainBean rmb = new RecipeMainBean();
        rmb.setRecTitle("Apple");
        rmb.setRecPic("aaa");
        rmb.setCategoryId(3);

        RecipeStepBean sb = new RecipeStepBean();
        sb.setStep("33");
        sb.setStepPic("bee");
        sb.setRecId(rmb.getRecId());
//
//        RecipeStepBean sb2 = new RecipeStepBean();
//        sb2.setStep("22");
//        sb2.setStepPic("222");
//
//        sb.setRecipeMainBean(rmb);
        rmb.getRecipeStepBeans().add(sb);
////        rmb.getRecipeStepBeans().add(sb2);
//
        RecipeMainBean In = recipeMainDao.save(rmb);
//        RecipeStepBean out = repositoryStepDao.save(sb);
        System.out.println(In);
//        System.out.println(out);


//        Integer recCount = recipeMainDao.recCount(23);
//        List<RecipeMainBean> recipeMainList = recipeMainDao.findAllByUserid(23);
////        System.out.println(recCount);
//        for (RecipeMainBean apple :recipeMainList){
//            System.out.println(apple);
//        }
    }
}
