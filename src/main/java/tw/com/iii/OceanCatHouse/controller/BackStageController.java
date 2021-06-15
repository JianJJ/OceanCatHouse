package tw.com.iii.OceanCatHouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/backstage")
public class BackStageController {

    @RequestMapping("/home")
    public String home(){
        return "/views/backstage/backstage";
    }
}
