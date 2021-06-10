package tw.com.iii.OceanCatHouse;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;

import org.json.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.iii.OceanCatHouse.model.UserRepository;

@SpringBootTest
public class zeroTest {

	@Autowired
	private UserRepository userRepository;
	
//	var xhr = new XMLHttpRequest();
//	xhr.open('POST', 'https://yourbackend.example.com/tokensignin');
//	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//	xhr.onload = function() {
//	  console.log('Signed in as: ' + xhr.responseText);
//	};
//	xhr.send('idtoken=' + id_token);
	
	
	
	
	
	
	
	
	

	@Test
	public void AAA(HttpServletRequest req, HttpServletResponse resp) {
//		try {
//			// Google取得access_token的url
//			URL urlObtainToken = new URL("https://accounts.google.com/o/oauth2/token");
//			HttpURLConnection connectionObtainToken = (HttpURLConnection) urlObtainToken.openConnection();
//
//			// 設定此connection使用POST
//			connectionObtainToken.setRequestMethod("POST");
//			connectionObtainToken.setDoOutput(true);
//
//			// 開始傳送參數
//			OutputStreamWriter writer = new OutputStreamWriter(connectionObtainToken.getOutputStream());
//			writer.write("code=" + req.getParameter("code") + "&"); // 取得Google回傳的參數code
//			writer.write("client_id=xxxxxxxxxxxxxxxxxx&xxxx&"); // 這裡請將xxxx替換成自己的client_id
//			writer.write("client_secret=xxxxxxxxxxxxxxxxxxx&"); // 這裡請將xxxx替換成自己的client_serect
//			writer.write("redirect_uri=xxxxxxxxxxxxxxxxxxxx&"); // 這裡請將xxxx替換成自己的redirect_uri
//			writer.write("grant_type=authorization_code");
//			writer.close();
//
//			// 如果認證成功
//			if (connectionObtainToken.getResponseCode() == HttpURLConnection.HTTP_OK) {
//				StringBuilder sbLines = new StringBuilder("");
//
//				// 取得Google回傳的資料(JSON格式)
//				BufferedReader reader = new BufferedReader(
//						new InputStreamReader(connectionObtainToken.getInputStream(), "utf-8"));
//				String strLine = "";
//				while ((strLine = reader.readLine()) != null) {
//					sbLines.append(strLine);
//				}
//
//				// 把上面取回來的資料，放進JSONObject中，以方便我們直接存取到想要的參數
//				JSONObject jo = new JSONObject(sbLines.toString());
//
//				// 印出Google回傳的access token
//				resp.getWriter().println(jo.getString("access_token"));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
}
