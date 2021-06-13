package tw.com.iii.OceanCatHouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

@Controller
@RequestMapping("/createRecipe")

public class CreateRecipeController {

    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

    @PostMapping("/save")
    public ModelAndView save(@RequestParam(value="file") MultipartFile uploadFile,
                             HttpServletRequest request){
        String format = sdf.format(new Date());
        try {
            // 儲存圖片到mainpic資料夾
            uploadFile.transferTo(
                    new File("/Users/louisjian/大專/OceanCatHouse/src/main/resources/static/mainpic/"+format+".jpg"));
            System.out.println(format+".jpg");
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    @GetMapping("/add")
    public ModelAndView add(@RequestParam("RecTitle") String RecTitle){
        ModelAndView modelAndView = new ModelAndView();
//        CreateRecipeService createRecipeService = new CreateRecipeService();
//        int NewRecId = createRecipeService.createNewRecId();
//        modelAndView.addObject("RecId", NewRecId);
        modelAndView.addObject("RecTitle", RecTitle);
        modelAndView.setViewName("views/pages/createRecipeDetail");
        return modelAndView;
    }

}
