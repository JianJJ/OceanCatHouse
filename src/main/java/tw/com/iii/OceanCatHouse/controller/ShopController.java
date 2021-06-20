package tw.com.iii.OceanCatHouse.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.iii.OceanCatHouse.Tool.ZeroTools;
import tw.com.iii.OceanCatHouse.model.OrdersBean;
import tw.com.iii.OceanCatHouse.model.ProductBean;
import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.repository.ProductRepository;
import tw.com.iii.OceanCatHouse.repository.service.OrdersService;


@Controller
public class ShopController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrdersService ordersService;
    @Autowired
    private ZeroTools zTools;

    @RequestMapping(path = {"/views/ShoppingMall"})
    public String ShoppingMall() {
        return "views/shop/ShoppingMall";
    }

    @RequestMapping(
            path = {"/complete"}
    )
    public String complete() {
        return "/views/shop/complete";
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // 購物車 處理
    @SuppressWarnings("finally")
    @RequestMapping("/cat/{id}")
    public String cat(@PathVariable("id") Integer id, @RequestParam("num") Integer num, HttpSession session,
                      Model model) {
        Optional<ProductBean> op = productRepository.findById(id);
        ProductBean bean = op.get();
        model.addAttribute("productname", bean.getProductname());
        model.addAttribute("producttext", bean.getProducttext());
        model.addAttribute("sellingprice", bean.getSellingprice());
        model.addAttribute("productspecifications", bean.getProductspecifications());
        model.addAttribute("id", id);
        System.out.println("*****cat*****" + id);
        Map<String, Integer> cat = new HashMap<>();
        // 取資料
        Map<String, Integer> icat = (Map<String, Integer>) session.getAttribute("cat");
        if (icat != null)
            cat = icat;
        Integer SSS = null;// 紀錄的數量

        try {
            // 判斷有沒有當筆資料
            SSS = (Integer) icat.get(Integer.toString(id));
            System.out.println("SSS" + SSS);
            num = SSS + num;
        } catch (Exception e) {
//			沒資料 把數量加入
            System.out.println(e);
        } finally {
            System.out.println("num:" + num);
            cat.put(Integer.toString(id), num);
            session.setAttribute("cat", cat);
            return "redirect:/Details/" + id;
        }

    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // 商品細節資料
    @RequestMapping("/Details/{id}")
    public String Details(@PathVariable("id") Integer id, Model model) {
        System.out.println("/Details******************************************************************" + id);
        Optional<ProductBean> op = productRepository.findById(id);
        ProductBean bean = op.get();
        model.addAttribute("productname", bean.getProductname());
        model.addAttribute("producttext", bean.getProducttext());
        model.addAttribute("sellingprice", bean.getSellingprice());
        model.addAttribute("productspecifications", bean.getProductspecifications());
        model.addAttribute("id", bean.getProductid());
        return "views/shop/Details";
    }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //去輸入位置 資料轉換
    @RequestMapping("/toAddress")
    public String toAddress(HttpSession session,Model model) {
        System.out.println("**********");
        UserBean bean = (UserBean) session.getAttribute("user");
        if(session.getAttribute("user") == null){
            model.addAttribute("id",0);}
        else {
            model.addAttribute("id", bean.getUserid());
        }
        Map<String, Integer> cat = (Map<String, Integer>) session.getAttribute("cat");
        System.out.println(cat);

        if(cat == null ||cat.size() == 0){
            model.addAttribute("cat",0);}
        else {
            model.addAttribute("cat",  session.getAttribute("cat"));
        }
        if(session.getAttribute("state") == null){
            model.addAttribute("state",0);}
        else {
            model.addAttribute("state",session.getAttribute("state"));
        }
        return "/views/shop/address";
    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // 存訂單
    @RequestMapping("/saveOrder/{id}")
    public String saveOrder(@PathVariable("id") Integer userId, @RequestParam("address") String address,HttpSession session,Model model,@RequestParam("g-recaptcha-response") String token) {
        System.out.println("*****存訂單*****");
        OrdersBean bean = new OrdersBean();
        //儲存錯誤
        Map<String, String> errors = new HashMap<>();
        model.addAttribute("errors", errors);
        // 機器人判斷
        if (token == "" || !zTools.recaptcha(token)) {
            System.out.println("errors.put(\"recaptcha\", \"需要驗證\");");
            errors.put("recaptcha", "需要驗證");
        }
        // 地址判斷
        if (address == null || address.length() == 0) {
            errors.put("address", "需要輸入地址");
        }
            if (errors != null && !errors.isEmpty())
                return "views/shop/address";
        //取得購物車內容
        Map<String, Integer> cat = (Map<String, Integer>) session.getAttribute("cat");
        if (cat != null){
//          OrdersBean save =  ordersService.insert( userId , cat);
            System.out.println("*****存訂單成功*****");
            cat.clear();
//            model.addAttribute("orderId", save.getOrderId());
              session.setAttribute("orderId", 18);
            session.setAttribute("address", "台中市南屯區公益路二段51號18樓");
        }
        return "redirect:/complete";
    }

}
