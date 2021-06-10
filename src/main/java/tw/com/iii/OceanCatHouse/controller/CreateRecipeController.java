package tw.com.iii.OceanCatHouse.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
//import tw.com.iii.OceanCatHouse.model.RecipeBean;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.net.http.HttpRequest;

@Controller
@RequestMapping("/createRecipe")
public class CreateRecipeController {

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
