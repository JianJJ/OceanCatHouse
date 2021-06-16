package tw.com.iii.OceanCatHouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tw.com.iii.OceanCatHouse.model.UserBean;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/userBack")
public class UserBackController {

    @RequestMapping("/home")
    public String home(HttpSession session){
        UserBean name = (UserBean) session.getAttribute("name");

        System.out.println(name);

        return "/views/user/userHome";
    }

    @RequestMapping("userSetting")
    public String userSetting(){
        return "/views/user/userSetting";
    }

    @RequestMapping("userSetPassword")
    public String userSetPassword(){
        return "/views/user/userSetPassword";
    }
}
