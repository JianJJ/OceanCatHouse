package tw.com.iii.OceanCatHouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PublicController {
	@GetMapping(
			path = {"/", "/index"}
	)
	public String index() {
		return "/index";
	}
	
	@GetMapping(
			path = {"/secure/login.page"}
	)
	public String login() {
		return "/secure/login";
	}
	
	@GetMapping(
			path = {"/pages/product.page"}
	)
	public String product() {
		return "/pages/product";
	}
	@GetMapping(
			path = {"/views/signup"}
	)
	public String signup() {
		return "views/user/signup";
	}
	@GetMapping(
			path = {"/views/login"}
	)
	public String nlogin() {
		return "views/user/login";
	}
	
	
	@GetMapping(
			path = {"/views/forget"}
	)
	public String forget() {
		return "views/user/forget";
	}



	//食譜首頁
	@RequestMapping(
			path = {"/homePage"}
	)
	public String homePage() {
		return "views/RecipePages/homePage";

	}

	//食譜詳細頁面
	@RequestMapping(
			path = {"/recipeDetails"}
	)
	public String recipeDetails() {
		return "views/RecipePages/recipeDetails";

	}

	//食譜搜尋頁面
	@RequestMapping(
			path = {"/recipeSearch"}
	)
	public String recipeSearch() {
		return "views/RecipePages/recipeSearch";

	}


	//食譜頁首測試
	@RequestMapping(
			path = {"/top"}
	)
	public String topNav() {
		return "views/RecipePages/top_nav";

	}

	//食譜頁尾測試
	@RequestMapping(
			path = {"/bot"}
	)
	public String botNav() {
		return "views/RecipePages/bottom_nav";

	}



}
