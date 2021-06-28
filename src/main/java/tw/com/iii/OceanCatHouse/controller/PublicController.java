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
		return "index";
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



	//網站首頁
	@RequestMapping(
			path = {"/homePage"}
	)
	public String homePage() {
		return "views/RecipePages/homePage";

	}
	@RequestMapping("/t")
	public String t() {
		return "views/backstage/time";
	}
	




}
