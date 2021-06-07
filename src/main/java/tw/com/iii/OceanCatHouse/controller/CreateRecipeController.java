package tw.com.iii.OceanCatHouse.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CreateRecipeController {

    @GetMapping("/{RecipeName}")
    public ModelAndView createRecipe(@PathVariable("RecipeName")String RecipeName){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(RecipeName);
        modelAndView.setViewName("test01");
        return modelAndView;
    }
}
