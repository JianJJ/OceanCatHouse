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
import tw.com.iii.OceanCatHouse.model.RecipeBean;
import tw.com.iii.OceanCatHouse.model.RecipeCategoryBean;
import tw.com.iii.OceanCatHouse.repository.service.RecipeCategoryService;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/createRecipe")

public class CreateRecipeController {

    @Autowired
    private RecipeCategoryService recipeCategoryService;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

    @PostMapping(value = "/save",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ModelAndView save(@RequestParam(required = true, value = "file") MultipartFile[] uploadFileArray,
                             @RequestParam(required = true, value = "recipeDetail") String jsonrecipeDetail,
                             HttpServletRequest request) throws ParseException {
        ObjectMapper om = new ObjectMapper();
        try {
            Map<String, String> map = om.readValue(jsonrecipeDetail, new TypeReference<HashMap<String, String>>(){});
            System.out.println(map.get("RecTitle"));
            System.out.println(map.get("RecText"));
            System.out.println(map.get("RecNum"));
            System.out.println(map.get("RecTime"));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        for(MultipartFile apple : uploadFileArray){
            System.out.println(apple.getOriginalFilename());
        }

//        );
//          System.out.println(recipeBean.getRecTitle());
//          System.out.println(recipeBean.getRecText());
//          System.out.println(recipeBean.getRecNum());
//          System.out.println(recipeBean.getRecTime());

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

    @GetMapping("/add")
    public ModelAndView add(@RequestParam("RecTitle") String RecTitle,
                            @RequestParam("CategoryId") String CategoryId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("CategoryId", CategoryId);
        modelAndView.addObject("RecTitle", RecTitle);
        modelAndView.setViewName("views/pages/createRecipeDetail");
        System.out.println(CategoryId);

        return modelAndView;
    }


    @RequestMapping("/start")
    public ModelAndView createRecipeDetail(){
        ModelAndView modelAndView = new ModelAndView();
        List<RecipeCategoryBean> categoryList = recipeCategoryService.list();
        modelAndView.addObject("categoryList", categoryList);
        modelAndView.setViewName("/views/pages/createRecipe");

        return modelAndView;
    }
}
