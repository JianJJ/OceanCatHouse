package tw.com.iii.OceanCatHouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tw.com.iii.OceanCatHouse.model.ProductBean;
import tw.com.iii.OceanCatHouse.repository.ProductRepository;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/backstage")

public class BackStageController {
    @Autowired
    ProductRepository productRepository;

    @RequestMapping("/home")
    public String home(){
        return "/views/backstage/backstage";
    }

    @RequestMapping("/time")
    public String tiem(){
        return "views/backstage/time";
    }


    @RequestMapping("/product")
    public String prod(){
        return "views/backstage/product";
    }
    @RequestMapping("/r")
    public String recipeDetails(){
        return "views/RecipePages/recipeDetails";
    }

    @RequestMapping("/h")
    public String recipeSearch(){
        return "views/RecipePages/recipeSearch";
    }


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//讀取商品資訊
    @RequestMapping("/product/data")
    @ResponseBody
    public List<ProductBean> product(){
        System.out.println("*****讀取商品資訊 *****");
        List<ProductBean> result = productRepository.findAll();
        System.out.println(result);
        return result;
    }



}

