package tw.com.iii.OceanCatHouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import tw.com.iii.OceanCatHouse.Tool.ZeroTools;
import tw.com.iii.OceanCatHouse.model.RecipeMainBean;
import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.repository.RecipeMainRepository;
import tw.com.iii.OceanCatHouse.repository.UserRepository;
import tw.com.iii.OceanCatHouse.repository.service.RecipeMainService;
import tw.com.iii.OceanCatHouse.repository.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/userBack")
public class UserBackController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserRepository userDao;

    @Autowired
    private RecipeMainRepository recipeMainDao;

    @Autowired
    private RecipeMainService recipeMainService;

    // 到個人首頁
    @RequestMapping("/home")
    public String home(HttpSession session, HttpServletRequest request) {
        Optional<UserBean> byId = userDao.findById(21);
        UserBean user = byId.get();
        session.setAttribute("user", user);
            // 查看user自己的食譜數量
        Integer recCount = recipeMainDao.recCount(user.getUserid());
        List<RecipeMainBean> recipeMainList = recipeMainDao.findAllByUserid(user.getUserid());
        request.setAttribute("recCount", recCount);
        request.setAttribute("recipeMainList", recipeMainList);

        return "/views/user/userHome";
    }

    // 到個收藏食譜頁
    @RequestMapping("favorites")
    public ModelAndView favorites(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        UserBean user = (UserBean) session.getAttribute("user");
        List<RecipeMainBean> allByUserId = recipeMainService.findFavoritesByUserId(user.getUserid());
        modelAndView.addObject("mainBeanList", allByUserId);
        modelAndView.setViewName("/views/user/favorites");

        return modelAndView;
    }

    // 到個人資料設定頁
    @RequestMapping("userSetting")
    public String userSetting() {
        return "/views/user/userSetting";
    }

    // 到變更密碼頁
    @RequestMapping("userSetPassword")
    public String userSetPassword() {
        return "/views/user/userSetPassword";
    }


    // 更改頭像
    @PostMapping("/userPicUpload")
    @ResponseBody
    public String userPicUpload(@RequestParam(value = "file") MultipartFile userPic,
                                HttpSession session) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String picName = sdf.format(new Date()) + ".jpg";
        try {
            // 儲存改名後的圖片到資料夾
            if (userPic.getOriginalFilename().length() != 0) {
                userPic.transferTo(
                        new File("/Users/louisjian/大專/OceanCatHouse/src/main/resources/static/images/userPic/" + picName));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        UserBean user = (UserBean) session.getAttribute("user");
            // 刪除原先的檔案
        FileSystemUtils.deleteRecursively(new File("/Users/louisjian/大專/OceanCatHouse/src/main/resources/static/images/userPic/" + user.getUserpic()));
            // 存到資料庫
        user.setUserpic(picName);
        UserBean update = userService.update(user);
        System.out.println("Update:"+update);

        return "update OK";
    }

    // 密碼更改
    @PutMapping("/changePassword/{oldP}/{newP}")
    @ResponseBody
    public String changePassword(@PathVariable("oldP") String oldP,
                               @PathVariable("newP") String newP,
                               HttpSession session){
        UserBean user = (UserBean) session.getAttribute("user");
        UserBean userBean = userRepository.findUserByUserIdAndPassword(user.getUserid(),oldP);
        if(userBean != null){
            user.setUserpassword(newP);
            userService.update(user);
            return "密碼更新成功";
        }
        return "原始密碼輸入錯誤";
    }

    // 基本資料(姓名, 手機, 信箱)更改
    @PutMapping("/changeNPE/{newName}/{newPhone}/{newEmail}")
    @ResponseBody
    public String changeNPE(@PathVariable("newName")String newName,
                            @PathVariable("newPhone")String newPhone,
                            @PathVariable("newEmail")String newEmail,
                            HttpSession session){
        UserBean user = (UserBean) session.getAttribute("user");
        // 如果信箱有更改, 要重新寄驗證信, 狀態改為0
        if(newEmail != user.getEmail()){
            user.setEmail(newEmail);
            user.setState("0");
            ZeroTools sendMail = new ZeroTools();
            sendMail.mail(newEmail, "點擊連結,驗證信箱");
        }
        user.setUsername(newName);
        user.setUserphone(newPhone);
        UserBean update = userService.update(user);
        return update.getUsername()+"您好～資料已儲存成功";
    }

    // 新增收藏分類
    @GetMapping("/addFavoriteCategory/{CategoryName}")
    @ResponseBody
    public String addFavoriteCategory(@PathVariable("CategoryName")String cName){


        return "新增成功";
    }
}