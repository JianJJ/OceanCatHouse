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
		return "/views/signup";
	}
	@GetMapping(
			path = {"/views/login"}
	)
	public String nlogin() {
		return "/views/login";
	}
	
	
	@GetMapping(
			path = {"/views/forget"}
	)
	public String forget() {
		return "/views/forget";
	}
	
	@RequestMapping("/createRecipe")
	public String createRecipeDetail(){

		System.out.println();
		return "/views/pages/createRecipe";}
	
	//食譜首頁
	@RequestMapping(
			path = {"/homePage"}
			)
	public String homePage() {
		return "/homePage";
		
	}
	
	//食譜詳細頁面
	@RequestMapping(
			path = {"/recipeDetails"}
			)
	public String recipeDetails() {
		return "/recipeDetails";
		
	}
		
	//食譜搜尋頁面
	@RequestMapping(
			path = {"/recipeSearch"}
			)
	public String recipeSearch() {
		return "/recipeSearch";
		
	}
	
	
	
}
