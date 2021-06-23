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
    private RecipeCategoryService recipeCategoryService;

    @Autowired
    private RecipeMainService recipeMainService;

    @Autowired
    private RecipeMainRepository recipeMainDao;

    @Autowired
    private RecipeMaterialRepository materialRepositoryDao;

    @Autowired
    private RecipeStepRepository recipeStepDao;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

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

    // 發布食譜
    @PostMapping(value = "/save",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @ResponseBody
    public String save(HttpSession session,
                       MultipartHttpServletRequest multipartRequest) throws ParseException {
        // 獲取檔案文件
        String recipeDetail = multipartRequest.getParameter("recipeDetail");
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String recCreated = simpleDateFormat.format(new Date());
        Map<String, Object> map =null;
        try {
            // 解析JSON資料
            ObjectMapper om = new ObjectMapper();
            map = om.readValue(recipeDetail, new TypeReference<HashMap<String, Object>>(){});
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        UserBean user = (UserBean) session.getAttribute("user");
        RecipeMainBean main = (RecipeMainBean) session.getAttribute("main");
        RecipeMainBean recipeMainBean = new RecipeMainBean();
        recipeMainBean.setCategoryId(Integer.parseInt((String)map.get("CategoryId")));
        recipeMainBean.setRecTitle((String)map.get("RecTitle"));
        recipeMainBean.setRecText((String)map.get("RecText"));
        recipeMainBean.setRecTime((String)map.get("RecTime"));
        recipeMainBean.setRecNum((String)map.get("RecNum"));
        String cal = (String)map.get("RecCal") != ""?(String) map.get("RecCal"):"0";
        recipeMainBean.setRecCal(Integer.parseInt(cal));
        recipeMainBean.setRecTag((String) map.get("RecTag"));
        recipeMainBean.setRecCreated(recCreated);
        recipeMainBean.setUserId(user.getUserid());
        recipeMainBean.setRecStatus(1);

        // 圖片儲存
        // 1. 改名
        String format = sdf.format(new Date())+".jpg";
        try {
            // 2. 儲存圖片到資料夾
            if(fileMap != null && fileMap.get("fileMain") != null){
                fileMap.get("fileMain").transferTo(
                        new File("/Users/louisjian/大專/OceanCatHouse/src/main/resources/static/images/mainpic/"+format));
                // 3. 儲存檔案名稱到資料庫
                recipeMainBean.setRecPic(format);
            }else {
                // 保存原本圖片名稱到資料庫
                recipeMainBean.setRecPic(main.getRecPic());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 這裡判斷是更新食譜, 還是新增食譜
        Boolean isUpdate = false;
        RecipeMainBean mainBean;
        Integer recid = 0;
        if(main != null){
            isUpdate = true;
            recid = main.getRecId();
            recipeMainBean.setRecId(recid);
            mainBean = recipeMainService.insert(recipeMainBean);
        }else {
            mainBean = recipeMainService.insert(recipeMainBean);
            recid = mainBean.getRecId();
        }
        // 刪除資料夾舊封面照片, 判斷更新是否有更換圖片
        if(isUpdate && fileMap != null && fileMap.get("fileMain") != null){
            FileSystemUtils.deleteRecursively(new File("/Users/louisjian/大專/OceanCatHouse/src/main/resources/static/images/mainpic/" + main.getRecPic()));
        }
        // 刪除舊食材表
        if(isUpdate && main.getRecipeMaterialBeans() != null){
            materialRepositoryDao.deleteAllByRecId(main.getRecId());
        }
        // 食材表 儲存資料庫
        RecipeMaterialBean recipeMaterialBean ;
        for(Map<String, String> food : (ArrayList<Map<String, String>>)(map.get("foodsArrayList"))){
            recipeMaterialBean = new RecipeMaterialBean();
            recipeMaterialBean.setMaterialName(food.get("MaterialName"));
            recipeMaterialBean.setUnitNum(food.get("UnitNum"));
            recipeMaterialBean.setGp("食材");
            recipeMaterialBean.setRecId(recid);
            materialRepositoryDao.save(recipeMaterialBean);
        }
        // 刪除步驟資料夾的舊照片
        // 沒有圖片, 有可能是沒有更新, 保留本的檔名
        if(isUpdate && main.getRecipeStepBeans() != null){
            // 刪除舊的步驟表
            recipeStepDao.deleteAllByRecId(main.getRecId());
        }
        // 步驟表 儲存資料庫(步驟, 步驟說明)
        RecipeStepBean recipeStepBean = null;
        String stepPicName = null;
        // spicName=點查看食譜那時候的圖片名稱
        List<Map<String, String>> spicNameList = (List<Map<String, String>>) map.get("SPicNameArray");
        // stepBeanList = 點查看時載入的step資料
        List<RecipeStepBean> stepBeanList;
        // stepList=前端傳來要更新的資料
        List<String> stepList = (List<String>)(map.get("StepTextArray"));
        for(int i=0;i<stepList.size();i++){
            recipeStepBean = new RecipeStepBean();
            recipeStepBean.setStep(String.valueOf(i+1));
            recipeStepBean.setStepText(stepList.get(i));
            if (fileMap.get("file"+i) != null){
                try {
                    stepPicName = sdf.format(new Date())+".jpg";
                    fileMap.get("file"+i).transferTo(
                            new File("/Users/louisjian/大專/OceanCatHouse/src/main/resources/static/images/stepPic/"+i+stepPicName));
                    recipeStepBean.setStepPic(i+stepPicName);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else {
                // 沒有圖檔, 判斷是不是保留更新前的圖檔
                if(spicNameList != null &&
                        i<spicNameList.size() &&
                        spicNameList.get(i) != null &&
                        spicNameList.get(i).get("SPicName"+(i+1)) != null){
                    stepPicName = spicNameList.get(i).get("SPicName"+(i+1));
                    recipeStepBean.setStepPic(stepPicName);
                    // 刪除本地資歷夾沒有保留下來的資料
//                    if(isUpdate){
//                        stepBeanList = main.getRecipeStepBeans();
//                        for(RecipeStepBean stepBean : stepBeanList){
//                            System.out.println(stepBean.getStepPic());
//                            System.out.println(stepPicName);
//                            if(stepBean != null &&
//                                    stepBean.getStepPic() != null &&
//                                    stepBean.getStepPic() != stepPicName) {
//                                FileSystemUtils.deleteRecursively(new File("/Users/louisjian/大專/OceanCatHouse/src/main/resources/static/images/stepPic/" + stepBean.getStepPic()));
//                                // 無法刪除對應的本地檔案
//                            }
//                        }
//                    }
                }
            }
            recipeStepBean.setRecId(recid);
            recipeStepDao.save(recipeStepBean);
        }
        System.out.println("mainBean:"+mainBean);
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
