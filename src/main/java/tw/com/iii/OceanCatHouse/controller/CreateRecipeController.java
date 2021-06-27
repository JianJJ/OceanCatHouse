package tw.com.iii.OceanCatHouse.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import tw.com.iii.OceanCatHouse.model.*;
import tw.com.iii.OceanCatHouse.repository.RecipeMainRepository;
import tw.com.iii.OceanCatHouse.repository.RecipeMaterialRepository;
import tw.com.iii.OceanCatHouse.repository.RecipeStepRepository;
import tw.com.iii.OceanCatHouse.repository.service.RecipeCategoryService;
import tw.com.iii.OceanCatHouse.repository.service.RecipeMainService;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/createRecipe")

public class CreateRecipeController {

    @Autowired
    private RecipeMainService recipeMainService;

    @Autowired
    private RecipeCategoryService recipeCategoryService;

    @Autowired
    private RecipeMainRepository recipeMainDao;



    // 查看食譜
    @GetMapping("/select/{recId}")
    public ModelAndView select(HttpSession session,
                               @PathVariable(value = "recId")Integer recId){
        ModelAndView modelAndView = new ModelAndView();
        Optional<RecipeMainBean> byId = recipeMainDao.findById(recId);
        RecipeMainBean bean = byId.get();
        session.setAttribute("main", bean);
        modelAndView.addObject("main", bean);
        modelAndView.addObject("stepList", bean.getRecipeStepBeans());
        modelAndView.addObject("materialList", bean.getRecipeMaterialBeans());
        modelAndView.setViewName("views/user/selectRecIdDetail");
        return modelAndView;
    }

    // 發布食譜（新增或更新）
    @PostMapping(value = "/save",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @ResponseBody
    public String save(HttpSession session,
                       MultipartHttpServletRequest multipartRequest) throws ParseException {

        recipeMainService.createOrUpdateRecipe(session, multipartRequest);

        return "/OceanCatHouse/userBack/home";
    }

    // 食譜的詳細頁(新增頁面)
    @GetMapping("/add")
    public ModelAndView add(@RequestParam("RecTitle") String RecTitle,
                            @RequestParam("CategoryId") String CategoryId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("CategoryId", CategoryId);
        modelAndView.addObject("RecTitle", RecTitle);
        modelAndView.setViewName("views/user/createRecipeDetail");

        return modelAndView;
    }

    // 新增食譜 分類頁
    @RequestMapping("/start")
    public ModelAndView createRecipeDetail(){
        ModelAndView modelAndView = new ModelAndView();
        List<RecipeCategoryBean> categoryList = recipeCategoryService.list();
        modelAndView.addObject("categoryList", categoryList);
        modelAndView.setViewName("/views/user/createRecipe");

        return modelAndView;
    }

    // 下架食譜
    @DeleteMapping("/delete/{recId}")
    @ResponseBody
    public String delete(@PathVariable("recId") Integer recId,
                         HttpSession session){
        RecipeMainBean main = (RecipeMainBean) session.getAttribute("main");
        main.setRecStatus(0);
        recipeMainDao.save(main);

        return "/OceanCatHouse/userBack/home";
    }

    // 取消編輯
    @RequestMapping("/goBack")
    @ResponseBody
    public String goBack(){
        return "/OceanCatHouse/userBack/home";
    }
}
