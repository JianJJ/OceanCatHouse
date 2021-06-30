package tw.com.iii.OceanCatHouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import tw.com.iii.OceanCatHouse.Tool.ZeroTools;
import tw.com.iii.OceanCatHouse.model.*;
import tw.com.iii.OceanCatHouse.repository.*;
import tw.com.iii.OceanCatHouse.repository.service.RecipeMainService;
import tw.com.iii.OceanCatHouse.repository.service.UserFavoritesCategoryService;
import tw.com.iii.OceanCatHouse.repository.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/userBack")
public class UserBackController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userDao;

    @Autowired
    private RecipeMainService recipeMainService;

    @Autowired
    private RecipeMainRepository recipeMainDao;

    @Autowired
    private UserFavoritesRepository userFavoritesDao;

    @Autowired
    private UserFavoritesCategoryRepository userFavoritesCategoryDao;

    @Autowired
    private UserFavoritesCategoryService userFavoritesCategoryService;

    @Autowired
    private UserCreditCardRepository userCreditCardDao;

    @Autowired
    private OrdersRepository ordersDao;

    // 到個人首頁
    @RequestMapping("/home")
    public String home(HttpSession session, HttpServletRequest request) {
        UserBean user = (UserBean) session.getAttribute("user");
        // 查看user自己的食譜數量
        Integer recCountStatus1 = recipeMainDao.recCountStatus1(user.getUserid());
        Integer recCountStatus0 = recipeMainDao.recCountStatus0(user.getUserid());
        List<RecipeMainBean> recipeMainList = recipeMainDao.findAllByUserid(user.getUserid());
        request.setAttribute("recCountStatus1", recCountStatus1);
        request.setAttribute("recCountStatus0", recCountStatus0);
        request.setAttribute("recipeMainList", recipeMainList);

        return "/views/user/userHome";
    }

    @RequestMapping("/selectRecMain")
    @ResponseBody
    public List<RecipeMainBean>  selectRecMain(HttpSession session){
        UserBean user = (UserBean) session.getAttribute("user");
        List<RecipeMainBean> recipeMainList = recipeMainDao.findAllByUserid(user.getUserid());

        return recipeMainList;
    }

    // user登出
    @RequestMapping("/userLogout")
    public String userLogout(HttpSession session){
        session.removeAttribute("user");
        session.removeAttribute("cat");
        return "index";
    }

    // 到個人資料設定頁
    @RequestMapping("/userSetting")
    public String userSetting() {
        return "/views/user/userSetting";
    }

    // 到變更密碼頁
    @RequestMapping("/userSetPassword")
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
                        new File("C:\\OceanCatHouse\\OceanCatHouse\\src\\main\\resources\\static\\images\\userPic\\" + picName));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        UserBean user = (UserBean) session.getAttribute("user");
            // 刪除原先的檔案
        FileSystemUtils.deleteRecursively(new File("C:\\OceanCatHouse\\OceanCatHouse\\src\\main\\resources\\static\\images\\userPic\\" + user.getUserpic()));
            // 存到資料庫
        user.setUserpic(picName);
        UserBean update = userService.update(user);

        return "update OK";
    }

    // 密碼更改
    @PutMapping("/changePassword/{oldP}/{newP}")
    @ResponseBody
    public String changePassword(@PathVariable("oldP") String oldP,
                               @PathVariable("newP") String newP,
                               HttpSession session){
        UserBean user = (UserBean) session.getAttribute("user");
        UserBean userBean = userDao.findUserByUserIdAndPassword(user.getUserid(),oldP);
        if(userBean != null){
            user.setUserpassword(newP);
            userService.update(user);
            return "密碼更新成功";
        }
        return "原始密碼輸入錯誤";
    }

    // 基本資料(姓名, 手機, 信箱)更改
    @PutMapping("/changeNPE/{newName}/{newPhone}/{newEmail}/{newAd}")
    @ResponseBody
    public String changeNPE(@PathVariable("newName")String newName,
                            @PathVariable("newPhone")String newPhone,
                            @PathVariable("newEmail")String newEmail,
                            @PathVariable("newAd")String newAd,
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
        user.setDeliveryAddress(newAd);
        UserBean update = userService.update(user);
        return update.getUsername()+"您好～資料已儲存成功";
    }

     // 查詢user的所有分類表資訊
    @GetMapping("/addFavoriteCategory/findAllCategory")
    @ResponseBody
    public List<UserFavoritesCategoryBean> findAllCategory(HttpSession session){
        UserFavoritesCategoryBean ufcBean = new UserFavoritesCategoryBean();
        UserBean user = (UserBean) session.getAttribute("user");
        List<UserFavoritesCategoryBean> ufcbList = userFavoritesCategoryDao.findAllByUserid(user.getUserid());

        return ufcbList;
    }

    // 新增收藏分類
    @GetMapping("/addFavoriteCategory/{CategoryName}")
    @ResponseBody
    public List<UserFavoritesCategoryBean> addFavoriteCategory(@PathVariable("CategoryName")String cName,
                                      HttpSession session){
        UserFavoritesCategoryBean ufcBean = new UserFavoritesCategoryBean();
        UserBean user = (UserBean) session.getAttribute("user");
        ufcBean.setUserid(user.getUserid());
        ufcBean.setFavoriteCategoryName(cName);
        userFavoritesCategoryDao.save(ufcBean);
        List<UserFavoritesCategoryBean> ufcbList = userFavoritesCategoryDao.findAllByUserid(user.getUserid());

        return ufcbList;
    }

    // 到個收藏食譜頁
    @RequestMapping("favorites")
    public ModelAndView favorites(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        UserBean user = (UserBean) session.getAttribute("user");
        List<RecipeMainBean> mainList = recipeMainService.findFavoritesByUserId(user.getUserid());
        List<UserFavoritesCategoryBean> UFCBList = userFavoritesCategoryDao.findAllByUserid(user.getUserid());
        modelAndView.addObject("mainBeanList", mainList);
        modelAndView.addObject("UFCBList", UFCBList);
        modelAndView.setViewName("/views/user/favorites");

        return modelAndView;
    }

    // 收藏頁面點擊分類查詢
    @GetMapping("/findAllMain/{cName}")
    @ResponseBody
    public List<RecipeMainBean> findAllMainByCategory(@PathVariable("cName") String cName,
                                             HttpSession session){
        UserBean user = (UserBean) session.getAttribute("user");
        List<RecipeMainBean> mainList = recipeMainService.findFavoritesByCategory(user.getUserid(), cName);

        return mainList;
    }

    // 收藏頁面查看全部
    @GetMapping("/findAllMain")
    @ResponseBody
    public List<RecipeMainBean> findAllMain(HttpSession session){
        UserBean user = (UserBean) session.getAttribute("user");
        List<RecipeMainBean> mainList = recipeMainService.findFavoritesByUserId(user.getUserid());
        return mainList;
    }

    // 關閉彈跳視窗, 更新編輯資料
    @PostMapping("/addFavoriteCategory/updateAllCategory")
    @ResponseBody
    public String updateAllCategory (HttpSession session,
                                     @RequestBody Map<String ,Object> map){
        List<Map<String, String >> update = (List<Map<String, String>>) map.get("update");
        Map<String, String > oldCname = (Map<String, String>) map.get("oldCname");
        UserBean user = (UserBean) session.getAttribute("user");
        UserFavoritesCategoryBean ufcBean = null;
        if(update != null){
            for(Map<String, String> idName:update){
                // 更新UFCB
                ufcBean = new UserFavoritesCategoryBean();
                if(idName != null && idName.get("FCid") != ""){
                    ufcBean.setFavoritesCategoryId(Integer.parseInt(idName.get("FCid")));
                    // 更新UFC類別名稱
                    if(oldCname !=null){
                        String oldname = oldCname.get(idName.get("FCid"));
                        Integer Uid = user.getUserid();
                        String name = idName.get("FCname");
                        // 名字有更新才做更改
                        if(oldname != name){
                            userFavoritesDao.updateCategoryName(name, Uid, oldname);
                        }
                    }
                }
                ufcBean.setUserid(user.getUserid());
                ufcBean.setFavoriteCategoryName(idName.get("FCname"));
                userFavoritesCategoryDao.save(ufcBean);
            }
        }
        // 刪除 移除的欄位
        List<String> delete = (List<String>) map.get("delete");
        for (String oldCid:delete){
            userFavoritesCategoryService.removerById(Integer.parseInt(oldCid), user.getUserid());
        }

        return "更新成功";
    }

    // user訂單管理
    @RequestMapping("/userOrders")
    public ModelAndView userOrders(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("views/user/userOrders");

        return modelAndView;
    }

    // 查詢user的全部信用卡
    @PostMapping("/selectCard")
    @ResponseBody
    public List<UserCreditCardBean> selectCard(HttpSession session){
        UserBean user = (UserBean) session.getAttribute("user");
        List<UserCreditCardBean> uccbList = userCreditCardDao.findAllByUserid(user.getUserid());

        return uccbList;
    }

    // 找到單張卡片的資料
    @PostMapping("/findCard/{cardId}")
    @ResponseBody
    public UserCreditCardBean findCard(@PathVariable("cardId") Integer cardId){
        Optional<UserCreditCardBean> byId = userCreditCardDao.findById(cardId);
        UserCreditCardBean userCreditCardBean = byId.get();

        return userCreditCardBean;
    }

    // 刪除卡片資料
    @DeleteMapping("/delCard/{cardid}")
    @ResponseBody
    public String delCard(@PathVariable("cardid") Integer cardid){
        userCreditCardDao.deleteById(cardid);

        return "卡片已刪除";
    }

    // 新增信用卡
    @PostMapping("/insertCard")
    @ResponseBody
    public String insertCard(@RequestBody UserCreditCardBean userCreditCardBean,
                                         HttpSession session){
        UserBean user = (UserBean) session.getAttribute("user");
        userCreditCardBean.setUserid(user.getUserid());
        userCreditCardDao.save(userCreditCardBean);

        return "新增/更新成功";
    }

    // user查看全部訂單
    @GetMapping("/selectOrders")
    @ResponseBody
    public Map<String, List> selectOrders(HttpSession session){
        UserBean user = (UserBean) session.getAttribute("user");
        Map<String, List> jsonMap = new HashMap<>();
        List<OrdersBean> ordersList = ordersDao.findByUseridOrderByOrdercreateonDesc(user.getUserid());
        List orderDetailList = new LinkedList();
        List productList = new LinkedList();
        List orderStatusBean = new LinkedList();
        List userPaymentBean = new LinkedList();
        for(OrdersBean order : ordersList){
            orderStatusBean.add(order.getOrderStatusBean());
            userPaymentBean.add(order.getUserPaymentMethodBean());
            orderDetailList.add(order.getOrderDetailBeans());
            List product = new LinkedList();
            for(OrderDetailBean odb : order.getOrderDetailBeans()){
                product.add(odb.getProductBean());
            }
            productList.add(product);
        }
        jsonMap.put("ordersList", ordersList);
        jsonMap.put("orderDetailList", orderDetailList);
        jsonMap.put("orderStatusBean", orderStatusBean);
        jsonMap.put("userPaymentBean", userPaymentBean);
        jsonMap.put("productList", productList);
        return jsonMap;
    }

    // user查看詳細訂單
    @GetMapping("/showDetail/{orderId}")
    public ModelAndView selectDetail(@PathVariable("orderId") Integer orderId){
        ModelAndView modelAndView = new ModelAndView();
        Optional<OrdersBean> optional = ordersDao.findById(orderId);
        OrdersBean ordersBean = optional.get();
        modelAndView.addObject("ordersBean", ordersBean);
        modelAndView.setViewName("views/user/userOrderDetail");

        return modelAndView;
    }
}