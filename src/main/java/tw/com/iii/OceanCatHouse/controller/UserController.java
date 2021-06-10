package tw.com.iii.OceanCatHouse.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.iii.OceanCatHouse.Tool.ZeroTools;
import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.model.UserRepository;

@Controller
public class UserController {
	@GetMapping(
			path = {"/views/phoneLogin"}
	)
	public String index() {
		return "/views/phoneLogin";
	}
	
	
	
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ZeroTools zTools;
	@RequestMapping("/forget/{controller}")
	public String forget(UserBean bean, Model model, Locale locale, HttpSession session,@RequestParam("g-recaptcha-response") String token) {
		System.out.println("*****forget******");
		System.out.println(bean);
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		// 機器人判斷
		if (token == "" || !zTools.recaptcha(token)) {
			System.out.println("errors.put(\"recaptcha\", \"需要驗證\");");
			errors.put("recaptcha", "需要驗證");
			}
		// 郵件格式判斷
		if (bean.getEmail() == null || bean.getEmail().length() == 0) {
			errors.put("email", "Email錯誤");
			return "/views/forget";
		}
		if (!bean.getEmail().contains("@")) errors.put("email", "Email錯誤");
		
		if (errors != null && !errors.isEmpty()) return "/views/forget";
			
		// 寄發郵件
		String text = "<p><a href='http://wizard71029.synology.me:7070/AAA'>從新設定密碼</a></p>";
		zTools.mail(bean.getEmail(), text);
		return "/index";
	}

	

	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/signup/{action}")
	public String signup(UserBean bean, Model model, Locale locale, @PathVariable("action") String action,
			HttpSession session,@RequestParam("g-recaptcha-response") String token) {
		
		System.out.println(token);
		System.out.println("*****" + action + "******");
		System.out.println(bean);// 接收input
		
		boolean recaptcha = zTools.recaptcha(token);
		System.out.println(session.getAttribute("success"));// 機器人判斷
		// 接收資料
		// 轉換資料
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		// 機器人判斷
		if (!recaptcha) {
			System.out.println("errors.put(recaptcha, 需要驗證)");
			errors.put("recaptcha", "需要驗證");
		}
		// 判斷欄位輸入
		if (bean.getUserphone() == null || bean.getUserphone().length() == 0) {
			errors.put("userphone", "手機號碼錯誤");
		}
		if (bean.getEmail() == null || bean.getEmail().length() == 0) {
			errors.put("email", "Email錯誤");
		}
		if (bean.getUsername() == null || bean.getUsername().length() == 0) {
			if (action.equals("signup"))
				errors.put("username", "暱稱錯誤");
		}
		if (bean.getUserpassword() == null || bean.getUserpassword().length() == 0) {
			errors.put("userpassword", "密碼錯誤");
		}

		if (errors != null && !errors.isEmpty()) {
			if (action.equals("login")) {
				return "/views/login";
			} else if(action.equals("signup")){
				return "/views/signup";
			}else{
				return "/views/phoneLogin";
			}

		}
		// 登入 判斷email,密碼是否正確
		if (action != null && action.equals("login")) {
			if (userRepository.existsByemail(bean.getEmail())) {
				if (userRepository.existsByuserpassword(bean.getUserpassword())) {
					System.out.println("login*************************");
				}

			}

		}
		// 註冊 判斷email是否重複
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

		if (action.equals("login")) {
			return "/index";
		} else {
			return "/index";
		}

	}

}
