package tw.com.iii.OceanCatHouse.controller;

import java.util.HashMap;

import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.model.UserRepository;



@Controller
public class UserController {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private MessageSource messageSource;

	@RequestMapping("/signup/{action}")
	public String signup(UserBean bean, Model model, Locale locale, @PathVariable("action") String action) {
		System.out.println("*****" + action + "******");
		System.out.println(bean);
		// 接收資料
		// 轉換資料
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		if (bean.getEmail() == null || bean.getEmail().length() == 0) {
			errors.put("email", "Email錯誤");
		}
		if (bean.getUsername() == null || bean.getUsername().length() == 0) {
			if(action.equals("signup"))errors.put("username", "暱稱錯誤");
		}
		if (bean.getUserpassword() == null || bean.getUserpassword().length() == 0) {
			errors.put("userpassword", "密碼錯誤");
		}

			
		if (errors != null && !errors.isEmpty()) {
			if(action.equals("login")) {
				return "/views/login";
			}else {
				return "/views/signup";
			}
			
		}

		if (action != null && action.equals("login")) {
			if (userRepository.existsByemail(bean.getEmail())) {
				if (userRepository.existsByuserpassword(bean.getUserpassword())) {
					System.out.println("login*************************");
				}

			}

		}
		if (action != null && action.equals("signup")) {
			if (!userRepository.existsByemail(bean.getEmail())) {
				if (!userRepository.existsByuserpassword(bean.getUsername())) {
					System.out.println("存資料");
					userRepository.save(bean);
				} else {
					System.out.println("名稱重複");
				}
			} else {
				System.out.println("Email重複");
			}

		}

		if(action.equals("login")) {
			return "/views/login";
		}else {
			return "/views/signup";
		}

	}
	@RequestMapping("/forget")
	public void forget(UserBean bean, Model model, Locale locale) {
		System.out.println("*****forget******");
		System.out.println(bean);
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		if (bean.getEmail() == null || bean.getEmail().length() == 0) {
			errors.put("email", "Email錯誤");
		}
	}
}
