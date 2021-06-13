package tw.com.iii.OceanCatHouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

@Controller
@RequestMapping("/createRecipe")
@MultipartConfig(
        location = "/Users/louisjian/大專/OceanCatHouse/src/main/resources/static/mainpic"
)
public class CreateRecipeController {

    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

    @PostMapping("/save")
    public ModelAndView save(@RequestParam(value="file") MultipartFile uploadFile,
                             HttpServletRequest request){

        Collection<Part> parts = null;
        try {
            parts = request.getParts();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
        for(Part part : parts) {
            String type = part.getContentType();
            String name = part.getName();
            String sname = part.getSubmittedFileName();

            System.out.println(name+":"+type+":"+sname);

//            SimpleDateFormat sdf =
//                    new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss_SSS");
//            String filename = "Louis"+sdf.format(new Date()) + ".jpg";

            if(name.equals("file")) {
                System.out.println("apple");
                if(sname.length() == 0) {
                    continue;
                }
                try {
                    System.out.println("Bee");
                    part.write("apple.jpg");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

//        String format = sdf.format(new Date());
//
//        try {
//            // 存檔
//            String filePath = request.getSession().getServletContext().getRealPath("/");
//            uploadFile.transferTo(new File(filePath));
//
//
//            // 返回上傳檔案的訪問路徑
////            String filePath = request.getScheme()+":"+request.getServerName()+":"+
////                    request.getServerPort()+":"+format;
//            System.out.println(filePath);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

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
