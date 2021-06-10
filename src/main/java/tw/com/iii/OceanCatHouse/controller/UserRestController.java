package tw.com.iii.OceanCatHouse.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;

import tw.com.iii.OceanCatHouse.Tool.ZeroTools;
import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.model.UserRepository;



@RestController
public class UserRestController {
	
	@Autowired
	private ZeroTools zTools;
	
	@Autowired 
	private UserRepository userRepository;

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
			  
			  if(userRepository.existsByemail(email)) {
				System.out.println("login");  
			  }else {
				  System.out.println("註冊");
				  UserBean bean = new UserBean();
				  bean.setUserpassword("googleOauth");
				  bean.setEmail(email);
				  bean.setUsername(name);
				  String text = "<p>歡迎加入海貓食屋</p>";
				 zTools.mail(email, text);
				  userRepository.save(bean);
			}
			  
			  // Use or store profile information
			  // ...

			} else {
			  System.out.println("Invalid ID token.");
			}
	}
	
	
}
