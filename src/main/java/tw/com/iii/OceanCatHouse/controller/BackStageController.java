package tw.com.iii.OceanCatHouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import tw.com.iii.OceanCatHouse.model.*;
import tw.com.iii.OceanCatHouse.repository.*;
import tw.com.iii.OceanCatHouse.repository.service.ProductService;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/backstage")

public class BackStageController {
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ProductService productService;
    @Autowired
    private OrdersRepository ordersRepository;
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    @Autowired
    private ProductPictureJpaReposit productPictureJpaReposit;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private StaffRepository staffRepository;

    @RequestMapping("/home")
    public String home() {
        return "/views/backstage/backstage";
    }

    @RequestMapping("/time")
    public String time() {
        return "views/backstage/time";
    }


    @RequestMapping("/order")
    public String order() {
        return "views/backstage/order";
    }

    @RequestMapping("/statistics")
    public String statistics() {
        return "views/backstage/statistics";
    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//讀取商品資訊 和分頁
    @RequestMapping("/product")
    public String prod(Model model, @RequestParam("pag") Integer p, @RequestParam("state") String state) {
        System.out.println("*****讀取商品資訊 *****");
        Page<ProductBean> page = productRepository.findByProductstatus(state, PageRequest.of(p - 1, 20));
        List<ProductBean> result = page.getContent();
        model.addAttribute("product", result);
        return "views/backstage/product";
    }

    //讀取最多頁數
    @RequestMapping("/product/data/{page}")
    @ResponseBody
    public Integer page(@PathVariable("page") Integer p) {
        System.out.println("*****讀取最多頁數 *****");
        Page<ProductBean> page = productRepository.findByProductstatus("1", PageRequest.of(p - 1, 20));
        return page.getTotalPages();
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//修改商品
    @RequestMapping("/updata/{productid}")
    public String updata(ProductBean bean, @PathVariable("productid") Integer productid) {
        System.out.println("*****修改商品 *****");
        System.out.println(bean);
        bean.setProductid(productid);
        productService.insert(bean);
        return "redirect:/backstage/product?pag=1&state=1";
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//新增商品
    @RequestMapping("/updata/")
    public String updata(ProductBean bean, Model model) {
        System.out.println("*****新增商品 *****");
        //使有輸入的資料能返回
        model.addAttribute("productmodel", bean.getProductmodel());
        model.addAttribute("productname", bean.getProductname());
        model.addAttribute("producttext", bean.getProducttext());
        model.addAttribute("purchaseprice", bean.getPurchaseprice());
        model.addAttribute("sellingprice", bean.getSellingprice());
        model.addAttribute("stocks", bean.getStocks());
        model.addAttribute("productspecifications", bean.getProductspecifications());
        model.addAttribute("vendorid", bean.getVendorid());
        model.addAttribute("productcategoryid", bean.getProductcategoryid());
        model.addAttribute("productstatus", bean.getStocks());
        Page<ProductBean> page = productRepository.findByProductstatus("1", PageRequest.of(0, 20));
        List<ProductBean> result = page.getContent();
        model.addAttribute("product", result);
        // 判斷欄位輸入
        Map<String, String> errors = new HashMap<>();
        model.addAttribute("errors", errors);

        if (bean.getProductmodel() == null || bean.getProductmodel().length() == 0) {
            errors.put("productmodel", "需要商品號");
        }
        if (bean.getProductname() == null || bean.getProductname().length() == 0) {
            errors.put("productname", "需要名稱");
        }
        if (bean.getProducttext() == null || bean.getProducttext().length() == 0) {
            errors.put("producttext", "需要詳細描述");
        }
        if (bean.getPurchaseprice() == null || bean.getPurchaseprice() == 0) {
            errors.put("purchaseprice", "需要進價");
        }
        if (bean.getSellingprice() == null || bean.getSellingprice() == 0) {
            errors.put("sellingprice", "需要售價");
        }
        if (bean.getStocks() == null || bean.getStocks() == 0) {
            errors.put("stocks", "需要庫存量");
        }
        if (bean.getProductspecifications() == null || bean.getProductspecifications().length() == 0) {
            errors.put("productspecifications", "需要商品規格");
        }
        if (bean.getVendorid() == null || bean.getVendorid() == 0) {
            errors.put("vendorid", "需要廠商號");
        }
        if (bean.getProductcategoryid() == null || bean.getProductcategoryid() == 0) {
            errors.put("productcategoryid", "需要商品總類");
        }
        if (bean.getStocks() == null || bean.getStocks() == 0) {
            errors.put("productstatus", "需要狀態");
        }
        if (productRepository.existsByProductmodel(bean.getProductmodel())) {
            errors.put("productmodel", "商品號重複");
        }


        if (errors != null && !errors.isEmpty()) return "/views/backstage/product";


        System.out.println(bean);
        productService.insert(bean);
        return "redirect:/backstage/product?pag=1&state=1";
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //搜索商品資訊
    @RequestMapping("/selectproduct/{name}")
    @ResponseBody
    public List<ProductBean> product(@PathVariable("name") String name) {
        System.out.println("*****搜索商品資訊 *****");
        return productRepository.findByProductnameLike("%" + name + "%");
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //讀取訂單
    @RequestMapping("/selectorder")
    @ResponseBody
    public List<Map<String, String>> selectorder(@RequestParam("state") Integer state) {
        System.out.println("*****搜索訂單資訊 *****");
        List<OrdersBean> lis = ordersRepository.findAll();
        List<Map<String, String>> result = new ArrayList<>();
        System.out.println(lis);
        int s = 0;
        for (OrdersBean bean : lis) {
            switch (bean.getOrderstatusid()) {
                case 0:
                case 1:
                    s=1;
                    break;
                case 2:
                    s=2;
                    break;
                case 3:
                case 4:
                s=3;
            }

            if (state == s ) {//狀態對才做

                System.out.println(bean);
                System.out.println(bean.getOrderstatusid());
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd E");
                String CreateOn = sdf.format(bean.getOrdercreateon());
                Map<String, String> map = new HashMap<>();
                map.put("orderId", bean.getOrderid() + "");
                map.put("orderCreateOn", CreateOn);
                map.put("userId", bean.getUserid() + "");
                Optional<UserBean> optionalUserBean = userRepository.findById(bean.getUserid());
                UserBean userBean = optionalUserBean.get();
                map.put("userName", userBean.getUsername());
                map.put("orderStatusId", bean.getOrderstatusid() + "");
                map.put("address", bean.getAddress());

                result.add(map);
            }
        }
        return result;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //訂單細節
    @RequestMapping("/orderDetail/{id}")
    @ResponseBody
    public List<Map<String, String>> orderDetail(@PathVariable("id") Integer orderid) {
        System.out.println("*****搜索訂單細節 *****");
        List<OrderDetailBean> list = orderDetailRepository.findByorderid(orderid);
        List<Map<String, String>> result = new ArrayList<>();
        for (OrderDetailBean odb : list) {
            Map<String, String> map = new HashMap<>();
            map.put("orderId", odb.getOrderid() + "");
            Optional<ProductBean> op = productRepository.findById(odb.getProductid());
            ProductBean b = op.get();
            map.put("productname", b.getProductname());
            map.put("SellingPrice", b.getSellingprice() + "");
            map.put("Unit", odb.getQuantity() + "");
            result.add(map);
        }

        System.out.println(result);
        return result;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//上傳圖片
    @RequestMapping("/addPic/{Productid}")
    public String pic(MultipartHttpServletRequest multipartRequest, @PathVariable("Productid") Integer Productid, Model model) {
        System.out.println("*****上傳圖片 *****");
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        System.out.println(fileMap);
        Optional<ProductBean> op = productRepository.findById(Productid);
        ProductBean bean = op.get();
        String Productmodel = bean.getProductmodel();
        // 圖片儲存
        try {
            for (int i = 1; i <= fileMap.size(); i++) {
                // 2. 儲存圖片到資料夾
                if (fileMap.get("file" + i) != null) {
                    System.out.println("AAA" + i);
                    //  改名+存檔
                    fileMap.get("file" + i).transferTo(new File("C:\\OceanCatHouse\\OceanCatHouse\\src\\main\\resources\\static\\images/shop/" + Productmodel + "-" + i + ".jpg"));
                    // 3. 儲存檔案名稱到資料庫
                    ProductPictureBean pBean = productPictureJpaReposit.findProducturl(Productmodel + "-" + i);
                    if (pBean == null) {
                        pBean = new ProductPictureBean();
                    }
                    pBean.setProducturl(Productmodel + "-" + i);
                    pBean.setProductid(Productid);
                    productPictureJpaReposit.save(pBean);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        Page<ProductBean> page = productRepository.findByProductstatus("1", PageRequest.of(0, 20));
        List<ProductBean> result = page.getContent();
        model.addAttribute("product", result);
        return "/views/backstage/product";

    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//讀取圖案
    @RequestMapping("/selectPic/{Productid}")
    @ResponseBody
    public List<ProductPictureBean> findPic(@PathVariable("Productid") Integer Productid) {
        System.out.println("*****搜索圖片 *****");
        return productPictureJpaReposit.findPic(Productid);
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//刪除圖案
    @RequestMapping("/delPic/{Productid}/{productpictureid}")
    @ResponseBody
    public boolean delPic(@PathVariable("Productid") Integer Productid, @PathVariable("productpictureid") Integer productpictureid) {
        System.out.println("*****刪除圖片 *****");
        Optional<ProductPictureBean> op = productPictureJpaReposit.findById(productpictureid);
        ProductPictureBean bean = op.get();
        productPictureJpaReposit.delete(bean);
        return true;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//修改訂單
    @RequestMapping("/state/{orderId}")
    public String state(@PathVariable("orderId") Integer orderId, @RequestParam("orderStatus") Integer orderStatus) {
        Optional<OrdersBean> op = ordersRepository.findById(orderId);
        OrdersBean bean = op.get();
        bean.setOrderstatusid(orderStatus);
        ordersRepository.save(bean);
        if(orderStatus == 4)orderStatus = 3;
        return "redirect:/backstage/order?pag=1&state="+orderStatus;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//會員資料
    @RequestMapping("/user/{userId}")
    public String user(Model model, @PathVariable("userId") Integer userId) {
        System.out.println("*****會員資料 *****");
        List<UserBean> user = new ArrayList<>();
        if (userId == 0) {
            user = userRepository.findAll();
        } else {
            Optional<UserBean> op = userRepository.findById(userId);
            System.out.println(op);
            UserBean ub = new UserBean();
            if (op.isPresent()) {
                ub = op.get();
                user.add(ub);
            } else {
                ub.setUserid(userId);
                ub.setUsername("未找到");
                ub.setUserphone("未找到");
                ub.setEmail("未找到");
                ub.setDeliveryAddress("未找到");
                user.add(ub);
            }

        }
        model.addAttribute("user", user);
        return "/views/backstage/user";
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //新增會員
    @RequestMapping("/addStaff/")
    public String addStaff(StaffBean bean, Model model) {
        System.out.println("*****新增會員 *****");
        //使有輸入的資料能返回
        model.addAttribute("name", bean.getName());
        model.addAttribute("email", bean.getEmail());
        model.addAttribute("password", bean.getPassword());
        model.addAttribute("position", bean.getPosition());
        model.addAttribute("phone", bean.getPhone());
        model.addAttribute("address", bean.getAddress());
        model.addAttribute("state", bean.getState());

//        Page<ProductBean> page = productRepository.findByProductstatus("1", PageRequest.of(0, 20));
//        List<ProductBean> result = page.getContent();
//        model.addAttribute("product", result);
        // 判斷欄位輸入
        Map<String, String> errors = new HashMap<>();
        model.addAttribute("errors", errors);

        if (bean.getName() == null || bean.getName().length() == 0) {
            errors.put("productmodel", "需要商品號");
        }
        if (bean.getEmail() == null || bean.getEmail().length() == 0) {
            errors.put("productname", "需要名稱");
        }
        if (bean.getPassword() == null || bean.getPassword().length() == 0) {
            errors.put("producttext", "需要詳細描述");
        }
        if (bean.getPosition() == null || bean.getPosition().length() == 0) {
            errors.put("purchaseprice", "需要進價");
        }
        if (bean.getPhone() == null || bean.getPhone().length() == 0) {
            errors.put("sellingprice", "需要售價");
        }
        if (bean.getAddress() == null || bean.getAddress().length() == 0) {
            errors.put("stocks", "需要庫存量");
        }
        if (errors != null && !errors.isEmpty()) return "/views/backstage/staff";
        System.out.println(bean);
        staffRepository.save(bean);
        return "redirect:/backstage/staff";
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //讀取會員定單
    @RequestMapping("/userOrder/{userId}")
    @ResponseBody
    public List<Map<String, String>> userOrder(@PathVariable("userId") Integer userId) {
        System.out.println("*****讀取會員定單*****" + userId);
        List<OrdersBean> lis = ordersRepository.findByUserid(userId);
        List<Map<String, String>> result = new ArrayList<>();
        for (OrdersBean bean : lis) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH E");
            String CreateOn = sdf.format(bean.getOrdercreateon());
            Map<String, String> map = new HashMap<>();
            map.put("orderId", bean.getOrderid() + "");
            map.put("orderCreateOn", CreateOn);
            map.put("userId", bean.getUserid() + "");
            Optional<UserBean> optionalUserBean = userRepository.findById(bean.getUserid());
            UserBean userBean = optionalUserBean.get();
            map.put("userName", userBean.getUsername());
            map.put("orderStatusId", bean.getOrderstatusid() + "");
            map.put("address", bean.getAddress());
            result.add(map);

        }

        return result;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//員工資料
    @RequestMapping("/staff")
    public String staff(Model model) {
        System.out.println("*****員工資料 *****");
        List<StaffBean> lis = staffRepository.findAll();
        model.addAttribute("staff", lis);
        return "/views/backstage/staff";
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //員工詳細
    @RequestMapping("/staffDetail/{staffId}")
    @ResponseBody
    public StaffBean staffDetail(@PathVariable("staffId") Integer staffId) {
        System.out.println("*****員工詳細 *****");
        Optional<StaffBean> op = staffRepository.findById(staffId);

        return op.get();
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //修改員工資料
    @RequestMapping("/changStaff/{staffId}")
    public String changStaff(StaffBean bean, Model model, @PathVariable("staffId") Integer staffId) {
        System.out.println("*****修改員工資料 *****");
        bean.setId(staffId);
        System.out.println(bean);
        staffRepository.save(bean);
        List<StaffBean> lis = staffRepository.findAll();
        model.addAttribute("staff", lis);
        return "/views/backstage/staff";
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //統計圖表
    @RequestMapping("/orderStatistics")
    @ResponseBody
    public Map<String, Integer> orderStatistics(@RequestParam("category") Integer category, @RequestParam("time") Integer time) {
        System.out.println("*****統計圖表 *****");
        //查詢一周訂單

        List<OrdersBean> ordersBeanList = ordersRepository.selectMonth();
        if (time == 1) ordersBeanList = ordersRepository.selectDay();
        if (time == 2) ordersBeanList = ordersRepository.selectWeek();
        //紀錄器(商品Id,數量)
        Map<Integer, Integer> count = new HashMap<>();
        //查出的訂單去找細節
        for (OrdersBean ordersBean : ordersBeanList) {
            List<OrderDetailBean> lis = orderDetailRepository.findByorderid(ordersBean.getOrderid());

            //取出商品 如果紀錄器內沒有  給當前數量, 如果紀錄器內有 拿出紀錄器內數量加當前數量
            for (OrderDetailBean ODbean : lis) {
                Integer i = ODbean.getQuantity();
                if (count.get(ODbean.getProductid()) == null) {
                    count.put(ODbean.getProductid(), i);
                } else {
                    i = count.get(ODbean.getProductid()) + ODbean.getQuantity();
                    count.put(ODbean.getProductid(), i);
                }
            }
        }
        //宣告結果
        Map<String, Integer> result = new HashMap<>();
        //id改名子
        for (Integer x : count.keySet()) {
            ProductBean pBean = productRepository.findByProductidAndProductcategoryid(x, category);
            if (pBean != null) result.put(pBean.getProductname(), count.get(x));
        }
        return result;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //商品線圖
    @RequestMapping("/productLine/{productId}")
    @ResponseBody
    public Map<String, Integer> productLine(@PathVariable("productId") Integer productId) {
        System.out.println("*****商品線圖*****" + productId);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String CreateOn = sdf.format(new Date());
        Map<String, Integer> result = new LinkedHashMap<>();
//        List<OrdersBean> lis= new ArrayList<>();

        for (int i = 6; i >= 0; i--) {
//            String CreateOn = sdf.format(new Date());
            //取出當天所有訂單
            List<OrdersBean> ordersBeanList = ordersRepository.selectDay(i);
            List<OrderDetailBean> orderDetailBeanList = new ArrayList<>();//訂單細節
            //紀錄器(商品Id,數量)
            Map<Integer, Integer> count = new HashMap<>();
            //遍歷當天所有訂單
            for (OrdersBean ob : ordersBeanList) {
                //取出日期/
                CreateOn = sdf.format(ob.getOrdercreateon());
                System.out.println(CreateOn);
                //取出訂單細節
                orderDetailBeanList = ob.getOrderDetailBeans();
                //遍歷訂單細節
                for (OrderDetailBean ODBean : orderDetailBeanList) {
                    //找到需要的商品
                    if (ODBean.getProductid() == productId) {
                        Integer x = ODBean.getQuantity();
                        if (count.get(ODBean.getProductid()) == null) {
                            count.put(ODBean.getProductid(), x);
                        } else {
                            x = count.get(ODBean.getProductid()) + ODBean.getQuantity();
                            count.put(ODBean.getProductid(), x);
                        }
                    }
                }
            }
            result.put(CreateOn, count.get(productId));

            System.out.println(count);
            System.out.println(orderDetailBeanList);
        }
        System.out.println("result : " + result);
        return result;
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}