package tw.com.iii.OceanCatHouse.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import tw.com.iii.OceanCatHouse.model.*;
import tw.com.iii.OceanCatHouse.repository.*;


@RestController
public class ShopRestController {
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private ProductPictureJpaReposit ppr;
	@Autowired
	private RecipeRepository recipeRepository;
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	@Autowired
	RecipeMaterialRepository recipeMaterialRepository;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 主頁身體
	@RequestMapping("/shopping")
	public List<ProductBean> mmmm(Model model) {
		System.out.println("/shopping**************************************************************************");
		Page<ProductBean> page = productRepository.findByProductstatus("1",PageRequest.of(0, 20));
//		page.getSize();每頁條數
//		page.getNumber();當前頁
//		page.getNumberOfElements();本頁條數
//		page.getTotalElements();全部幾筆
//		page.getTotalPages();全部有幾頁
		model.addAttribute("maxPage", page.getTotalPages());
		List<ProductBean> result = page.getContent();
		return result;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 主頁身體分類
	@RequestMapping("/shopping/{categoryid}")
	public List<ProductBean> categoryid(@PathVariable("categoryid") Integer categoryid,HttpSession session) {
		System.out.println("/categoryid*****************************************" + categoryid);
		Page<ProductBean> page = productRepository.findByProductstatusAndAndProductcategoryid("1", categoryid,PageRequest.of(0, 12));
		session.setAttribute("maxPage", page.getTotalPages());
		List<ProductBean> result = page.getContent();
		return result;
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	// 分資料
	@RequestMapping("/shopping/{categoryid}/{pag}")
	public List<ProductBean> pag(@PathVariable("categoryid") Integer categoryid, @PathVariable("pag") Integer pag) {
		System.out.println("***********/shopping/{categoryid}/{pag}****************" + categoryid);
		Page<ProductBean> page = null;
		if (categoryid == 0) {
			page = productRepository.findByProductstatus("1", PageRequest.of(pag - 1, 12));
		} else {
			page = productRepository.findByProductstatusAndAndProductcategoryid("1", categoryid, PageRequest.of(pag - 1, 12));
		}

		List<ProductBean> result = page.getContent();
		return result;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 圖片
	@RequestMapping("/pic/{mod}")
	public ResponseEntity<?> pic(@PathVariable("mod") Integer id) {
		System.out.println("/pic******************************************************************" + id);
		List<ProductPictureBean> result = ppr.findPic(id);
		if (result != null) {
			return ResponseEntity.ok(result);
		} else {
			return ResponseEntity.noContent().build();
		}
	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

//	// 同類商品
//	@GetMapping("/category/{id}")
//	public ResponseEntity<List<ProductBean>> category(@PathVariable("id") Integer id) {
//		System.out.println("category******************************************************************" + id);
//		List<ProductBean> result = productRepository.findProductcategoryid(id);
//		if (result != null) {
//			return ResponseEntity.ok(result);
//		} else {
//			return ResponseEntity.noContent().build();
//		}
//	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 幫轉購物車資料給js
	@GetMapping("/catData")
	public Map<String, Integer> cat(HttpSession session) {
		System.out.println("********catData********");
		Map<String, Integer> cat = (Map<String, Integer>) session.getAttribute("cat");
		return cat;
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	用id找資料
	@RequestMapping("/product/{id}")
	public ProductBean ById(@PathVariable("id") Integer id) {
		System.out.println("************productById******************");
		Optional<ProductBean> AAA = productRepository.findById(id);
		System.out.println(AAA.get());

		return AAA.get();
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//刪除購物車商品
	@RequestMapping("delCat/{id}")
	public HashMap<String, Integer> delCat(@PathVariable("id") Integer id,
			@RequestBody HashMap<String, Integer> body,HttpSession session) {
		System.out.println("********************delCat*****************************************" + id);
		body.remove("" + id);
		System.out.println(body);
		session.setAttribute("cat",body);
		return body;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//++購物車商品
	@RequestMapping("addCat/{id}")
	public HashMap<String, Integer> addCat(@PathVariable("id") String id,
			@RequestBody HashMap<String, Integer> body,HttpSession session) {
		System.out.println("********************addCat*****************************************" + id);
		int AAA = body.get(id);
		AAA++;
		body.put(id, AAA);
		session.setAttribute("cat",body);
		return body;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//---購物車商品
	@RequestMapping("cutCat/{id}")
	public HashMap<String, Integer> cutCat(@PathVariable("id") String id,
			@RequestBody HashMap<String, Integer> body,HttpSession session) {
		System.out.println("********************cutCat*****************************************" + id);
		int AAA = body.get(id);
		AAA--;
		body.put(id, AAA);
		session.setAttribute("cat",body);
		return body;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 推薦食譜
//	@RequestMapping("/recommend/{productid}")
//	public List<RecipeMainBean> recommend(@PathVariable("productid") Integer productid) {
//		System.out.println("********************推薦食譜*********************" );
//		Optional<ProductBean> op = productRepository.findById(productid);
//		ProductBean productBean = op.get();
//		Page<Integer> page = recipeMaterialRepository.findRecId(productBean.getProductkey(),PageRequest.of(0, 6));
//		int rand = (int) (Math.random()*page.getTotalPages());
//		page = recipeMaterialRepository.findRecId(productBean.getProductkey(),PageRequest.of(rand, 6));
//		System.out.println(page);
//		List<Integer> set = page.getContent();
//		System.out.println(set+" set ");
//		List<RecipeMainBean> result = new ArrayList<>();
//		for(Integer i : set){
//			Optional<RecipeMainBean> recipeOP =  recipeRepository.findById(i);
//			System.out.println(recipeOP+" recipeOP ");
//			RecipeMainBean recipe = recipeOP.get();
//			System.out.println(recipe+" recipe ");
//			result.add(recipe);
//		}
//		return result;
//	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//取得最大頁面數
	@RequestMapping("/pag/")
	public Integer pag() {
		System.out.println("/categoryid*****************************************" );
		Page<ProductBean> page = productRepository.findByProductstatus("1",PageRequest.of(0, 12));
		Integer AAA =  page.getTotalPages();
		return AAA;
	}
	@RequestMapping("/pag/{categoryid}")
	public Integer pagc(@PathVariable("categoryid") Integer categoryid) {
		System.out.println("/categoryid*****************************************" + categoryid);
		Page<ProductBean> page = null;
		if (categoryid == 0) {
			page = productRepository.findByProductstatus("1",PageRequest.of(0, 12));
		} else {
			page = productRepository.findByProductstatusAndAndProductcategoryid("1", categoryid, PageRequest.of(0, 12));
		}
		Integer AAA =  page.getTotalPages();
		return AAA;
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////

	//完成訂單
	@RequestMapping("/completeData/{id}")
	public List<OrderDetailBean> completeData(@PathVariable("id") Integer orderid){
		System.out.println("*****完成訂單細節 *****");
		List<OrderDetailBean> list =  orderDetailRepository.findByorderid(orderid);
		return list;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
