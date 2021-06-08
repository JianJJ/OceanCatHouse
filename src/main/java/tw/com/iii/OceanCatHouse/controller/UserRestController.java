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

import org.json.JSONObject;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.iii.OceanCatHouse.model.UserBean;

@RestController
public class UserRestController {

	
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

	@RequestMapping("/recaptcha")
	public String recaptcha(@RequestBody String body) {
		String ip = null;
		try {
			ip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(body);
		System.out.println("*****recaptcha******");

		JSONObject obj = new JSONObject();
		obj.put("secret", "");
		obj.put("response", body);
		obj.put("remoteip", ip);
		try {
			String url = "https://www.google.com/recaptcha/api/siteverify",
					params = "secret=" + "6LdUNRobAAAAAJR5LsTpyF-A_hIxRltekXBxWWAK" + "&response=" + body;

			HttpURLConnection http = (HttpURLConnection) new URL(url).openConnection();
			http.setDoOutput(true);
			http.setRequestMethod("POST");
			http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			OutputStream out = http.getOutputStream();
			out.write(params.getBytes("UTF-8"));
			out.flush();
			out.close();

			InputStream res = http.getInputStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(res, "UTF-8"));

			StringBuilder sb = new StringBuilder();
			int cp;
			while ((cp = rd.read()) != -1) {
				sb.append((char) cp);
			}
			JSONObject json = new JSONObject(sb.toString());
			System.out.println(json);
			res.close();

			return json.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
