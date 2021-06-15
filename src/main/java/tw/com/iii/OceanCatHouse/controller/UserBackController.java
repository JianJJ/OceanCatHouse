package tw.com.iii.OceanCatHouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/userBack")
public class UserBackController {

    @RequestMapping("/home")
    public String home(){
        return "/views/user/userHome";
    }
}
