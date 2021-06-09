package tw.com.iii.OceanCatHouse.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.security.GeneralSecurityException;
import java.util.Collections;


import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;

import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;


import com.google.api.client.json.gson.GsonFactory;



@RestController
public class UserRestController {
	
	private String secret ="";

	//機器人判斷
	@RequestMapping("/recaptcha")
	public String recaptcha(@RequestBody String body,HttpSession session) {
		//取得ip
		String ip = null;
		try {
			ip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//取得token
		System.out.println(body);
		System.out.println("*****recaptcha******");

//		JSONObject obj = new JSONObject();
//		obj.put("secret", "");
//		obj.put("response", body);
//		obj.put("remoteip", ip);
		try {
			//編輯google需要文件
			String url = "https://www.google.com/recaptcha/api/siteverify",
					params = "secret=" + secret + "&response=" + body;
			//開啟網路發送
			HttpURLConnection http = (HttpURLConnection) new URL(url).openConnection();
			http.setDoOutput(true);
			http.setRequestMethod("POST");
			http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			OutputStream out = http.getOutputStream();
			out.write(params.getBytes("UTF-8"));
			out.flush();
			out.close();
			//接收返回資料
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
			
			//判斷成功存在session
		if((boolean) json.get("success") ) {
				session.setAttribute("success", "ture");
		}
			return json.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	
	
	@RequestMapping("/oauth")
	public void name( String idtoken) {
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), new GsonFactory())
			    // Specify the CLIENT_ID of the app that accesses the backend:
			    .setAudience(Collections.singletonList("849367464998-0c4najofsqmh3rteejq2dc3va9iqdps2.apps.googleusercontent.com"))
			    // Or, if multiple clients access the backend:
			    //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
			    .build();

			// (Receive idTokenString by HTTPS POST)

			GoogleIdToken idToken=null;
			try {
				idToken = verifier.verify(idtoken);
			} catch (GeneralSecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (idToken != null) {
			  Payload payload = idToken.getPayload();

			  // Print user identifier
			  String userId = payload.getSubject();
			  System.out.println("User ID: " + userId);

			  // Get profile information from payload
			  String email = payload.getEmail();
			  boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			  String name = (String) payload.get("name");
			  String pictureUrl = (String) payload.get("picture");
			  String locale = (String) payload.get("locale");
			  String familyName = (String) payload.get("family_name");
			  String givenName = (String) payload.get("given_name");
			  System.out.println("User name: " + name);
			  System.out.println("User email: " + email);
			  System.out.println("User locale: " + locale);
			  System.out.println("User givenName: " + givenName);
			  
			  
			  
			  
			  // Use or store profile information
			  // ...

			} else {
			  System.out.println("Invalid ID token.");
			}
	}
	
	
}
