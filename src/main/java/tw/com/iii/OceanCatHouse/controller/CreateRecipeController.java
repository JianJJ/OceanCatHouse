package tw.com.iii.OceanCatHouse.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import tw.com.iii.OceanCatHouse.model.RecipeCategoryBean;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.RecipeMaterialBean;
import tw.com.iii.OceanCatHouse.repository.service.RecipeCategoryService;
import tw.com.iii.OceanCatHouse.repository.service.RecipeMainService;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/createRecipe")

public class CreateRecipeController {

    @Autowired
    private RecipeCategoryService recipeCategoryService;

    @Autowired
    private RecipeMainService recipeMainService;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

    @PostMapping(value = "/save",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ModelAndView save(@RequestParam(required = true, value = "file") MultipartFile[] uploadFileArray,
                             @RequestParam(required = true, value = "recipeDetail") String jsonrecipeDetail,
                             HttpServletRequest request) throws ParseException {

        ModelAndView modelAndView = new ModelAndView();
        ObjectMapper om = new ObjectMapper();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
        String recCreated = simpleDateFormat.format(new Date());
        try {
            System.out.println(jsonrecipeDetail);
            Map<String, Object> map = om.readValue(jsonrecipeDetail, new TypeReference<HashMap<String, Object>>(){});
//            RecipeMainBean recipeMainBean = new RecipeMainBean();
//            recipeMainBean.setCategoryId(Integer.parseInt((String)map.get("CategoryId")));
//            recipeMainBean.setRecTitle((String)map.get("RecTitle"));
//            recipeMainBean.setRecText((String)map.get("RecText"));
//            recipeMainBean.setRecTime(Integer.parseInt((String)map.get("RecTime")));
//            recipeMainBean.setRecNum(Integer.parseInt((String)map.get("RecNum")));
//            recipeMainBean.setRecCreated(recCreated);
//            recipeMainBean.setRecPic();
            // 之後要加一個userID
//            RecipeMainBean bean = recipeMainService.insert(recipeMainBean);

            RecipeMaterialBean recipeMaterialBean = null;
//            for(Map<String, String> food : (ArrayList<Map<String, String>>)(map.get("foodsArrayList"))){
//                recipeMaterialBean = new RecipeMaterialBean();
//                recipeMaterialBean.setMaterialName(food.get("MaterialName"));
//                recipeMaterialBean.setUnitNum(food.get("UnitNum"));
//                recipeMaterialBean.setGp("食材");
//            }

            for (String apple : (List<String>)(map.get("StepTextArray"))){
                System.out.println(apple);
            }
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        for(MultipartFile apple : uploadFileArray){
            System.out.println(apple.getOriginalFilename());
        }

//        String format = sdf.format(new Date());
//        try {
//            // 儲存圖片到mainpic資料夾
//            if(uploadFile.getOriginalFilename().length() != 0){
//                uploadFile.transferTo(
//                        new File("/Users/louisjian/大專/OceanCatHouse/src/main/resources/static/mainpic/"+format+".jpg"));
//                System.out.println(format+".jpg");
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

        return null;
    }

    // 新增食譜 詳細頁
    @GetMapping("/add")
    public ModelAndView add(@RequestParam("RecTitle") String RecTitle,
                            @RequestParam("CategoryId") String CategoryId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("CategoryId", CategoryId);
        modelAndView.addObject("RecTitle", RecTitle);
        modelAndView.setViewName("views/user/createRecipeDetail");
        System.out.println(CategoryId);

        return modelAndView;
    }

    // 新增食譜 分類頁
    @RequestMapping("/start")
    public ModelAndView createRecipeDetail(){
        ModelAndView modelAndView = new ModelAndView();
        List<RecipeCategoryBean> categoryList = recipeCategoryService.list();
        modelAndView.addObject("categoryList", categoryList);
        modelAndView.setViewName("/views/user/createRecipe");
        System.out.println(categoryList);

        return modelAndView;
    }
}
