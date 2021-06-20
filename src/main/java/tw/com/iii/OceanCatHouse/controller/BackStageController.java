package tw.com.iii.OceanCatHouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import tw.com.iii.OceanCatHouse.model.*;
import tw.com.iii.OceanCatHouse.repository.OrderDetailRepository;
import tw.com.iii.OceanCatHouse.repository.OrdersRepository;
import tw.com.iii.OceanCatHouse.repository.ProductPictureJpaReposit;
import tw.com.iii.OceanCatHouse.repository.ProductRepository;
import tw.com.iii.OceanCatHouse.repository.service.ProductService;

import java.io.File;
import java.io.IOException;
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

    @RequestMapping("/home")
    public String home() {
        return "/views/backstage/backstage";
    }

    @RequestMapping("/time")
    public String tiem() {
        return "views/backstage/time";
    }


    @RequestMapping("/product")
    public String prod() {
        return "views/backstage/product";
    }

    @RequestMapping("/order")
    public String order() {
        return "views/backstage/order";
    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//讀取商品資訊 和分頁
    @RequestMapping("/product/{pag}")
    @ResponseBody
    public List<ProductBean> product(@PathVariable("pag") Integer p) {
        System.out.println("*****讀取商品資訊 *****");
        Page<ProductBean> page = productRepository.findAll(PageRequest.of(p - 1, 20));
        List<ProductBean> result = page.getContent();
        return result;
    }

    //讀取最多頁數
    @RequestMapping("/product/data/{page}")
    @ResponseBody
    public Integer page(@PathVariable("page") Integer p) {
        System.out.println("*****讀取最多頁數 *****");
        Page<ProductBean> page = productRepository.findAll(PageRequest.of(p - 1, 20));
        Integer result = page.getTotalPages();
        return result;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//修改商品
    @RequestMapping("/updata/{productid}")
    public String updata(ProductBean bean, @PathVariable("productid") Integer productid, Model model) {
        System.out.println("*****修改商品 *****");
        System.out.println(bean);
        bean.setProductid(productid);
        productService.insert(bean);
        model.addAttribute("pag", 1);
        return "/views/backstage/product";
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//新增商品
    @RequestMapping("/updata/")
    public String updata(ProductBean bean, Model model) {
        System.out.println("*****修改商品 *****");
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

        if (errors != null && !errors.isEmpty()) return "/views/backstage/product";


        System.out.println(bean);
        productService.insert(bean);
        return "/views/backstage/product";
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //讀取商品資訊 和分頁
    @RequestMapping("/selectproduct/{name}")
    @ResponseBody
    public List<ProductBean> product(@PathVariable("name") String name) {
        System.out.println("*****搜索商品資訊 *****");

        List<ProductBean> result = productRepository.findByProductnameLike("%" + name + "%");
        return result;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //讀取訂單
    @RequestMapping("/selectorder")
    @ResponseBody
    public List<OrdersBean> selectorder() {
        System.out.println("*****搜索訂單資訊 *****");

        List<OrdersBean> result = ordersRepository.findAll();
        System.out.println(result);
        return result;
    }
    //訂單細節

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/orderDetail/{id}")
    @ResponseBody
    public List<Map<String, String>> orderDetail(@PathVariable("id") Integer orderid) {
        System.out.println("*****搜索訂單細節 *****");
        List<OrderDetailBean> list = orderDetailRepository.findByorderId(orderid);
        List<Map<String, String>> result = new ArrayList<>();
        for (OrderDetailBean odb : list) {
            Map<String, String> map = new HashMap<>();
            map.put("orderId", odb.getOrderId() + "");
            Optional<ProductBean> op = productRepository.findById(odb.getProductId());
            ProductBean b = op.get();
            map.put("productname", b.getProductname());
            map.put("SellingPrice", b.getSellingprice() + "");
            map.put("Unit", odb.getUnit() + "");
            result.add(map);
        }

        System.out.println(result);
        return result;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//上傳圖片
    @RequestMapping("/addPic/{Productid}")
    public String pic(MultipartHttpServletRequest multipartRequest, @PathVariable("Productid") Integer Productid) {
        System.out.println("*****上傳圖片 *****");
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        System.out.println(fileMap);
        Optional<ProductBean> op = productRepository.findById(Productid);
        ProductBean bean = op.get();
        String model = bean.getProductmodel();
        // 圖片儲存

        try {
            for (int i = 1; i <= fileMap.size(); i++)
                // 2. 儲存圖片到資料夾
                if (fileMap != null && fileMap.get("file" + i) != null) {
                    System.out.println("AAA" + i);
                    //  改名+存檔
                    fileMap.get("file" + i).transferTo(new File("C:\\JavaFramework0524\\JavaFramework\\OceanCatHouse\\src\\main\\resources\\static\\images/shop/" + model + "-" + i + ".jpg"));
                    // 3. 儲存檔案名稱到資料庫
                    ProductPictureBean pBean = productPictureJpaReposit.findProducturl(model + "-" + i);
                    if (pBean == null) {
                        pBean = new ProductPictureBean();
                    }
                    pBean.setProducturl(model + "-" + i);
                    pBean.setProductid(Productid);
                    productPictureJpaReposit.save(pBean);
                }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/backstage/product";

    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//讀取圖案
    @RequestMapping("/selectPic/{Productid}")
    @ResponseBody
    public List<ProductPictureBean> findPic(@PathVariable("Productid") Integer Productid) {
        System.out.println("*****搜索圖片 *****");
        List<ProductPictureBean> result = productPictureJpaReposit.findPic(Productid);
        return result;
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//刪除圖案
    @RequestMapping("/delPic/{Productid}/{i}")
    @ResponseBody
    public boolean delPic(@PathVariable("Productid") Integer Productid, @PathVariable("i") Integer i) {
        System.out.println("*****刪除圖片 *****");
        Optional<ProductBean> op = productRepository.findById(Productid);
        ProductBean bean = op.get();
        String m =bean.getProductmodel();
        ProductPictureBean pBean = productPictureJpaReposit.findProducturl(m + "-" + i);
        productPictureJpaReposit.delete(pBean);
        List<ProductPictureBean>  lis= productPictureJpaReposit.findPic(Productid);
        int x = 0;
        for(ProductPictureBean b : lis){
            x++;
            b.setProducturl(m + "-" + x);
            productPictureJpaReposit.save(b);
        }

        return true;


    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

