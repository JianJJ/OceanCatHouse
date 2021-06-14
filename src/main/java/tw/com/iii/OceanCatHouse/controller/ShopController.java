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

import tw.com.iii.OceanCatHouse.model.ProductBean;
import tw.com.iii.OceanCatHouse.model.ProductPictureJpaReposit;
import tw.com.iii.OceanCatHouse.model.ProductRepository;


@Controller
public class ShopController {

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private ProductPictureJpaReposit ppr;

	@RequestMapping(path = { "/views/ShoppingMall" })
	public String ShoppingMall() {
		return "/views/ShoppingMall";
	}

//	@RequestMapping(
//			path = {"/views/Details"}
//	)
//	public String Details() {
//		return "/views/Details";
//	}
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
		return "/views/Details";
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
