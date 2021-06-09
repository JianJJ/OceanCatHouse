package tw.com.iii.OceanCatHouse;

import java.io.InputStreamReader;
import java.net.Authenticator;
import java.util.Collections;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;

import tw.com.iii.OceanCatHouse.model.UserRepository;


@SpringBootTest
public class zeroTest {

	
	@Autowired
	private UserRepository userRepository;

	@Test
	public void AAA() {


			Properties props = new Properties();

			props.setProperty("mail.smtp.auth", "true"); // 發送伺服器需要身份驗證

			props.setProperty("mail.transport.protocol", "smtp"); // 發送郵件協議名稱

			props.setProperty("mail.smtp.host", "smtp.qq.com"); // 設置郵件伺服器主機名:qq是用 smtp.qq.com

			props.setProperty("mail.smtp.starttls.enable", "true"); //需要時使用SSL登陸方式，隨著各個Mail伺服器對於安全的重視，紛紛採用基於SSL的Mail登陸方式進行發送和接收電子郵件。例如GMail等。當使用JavaMail發送電子郵件時，需要根據SSL設定，增加安全驗證的功能。

			props.setProperty("mail.debug", "true"); // 開啟debug調試
			
			
			

			Session session = Session.getInstance(props);

			Message msg = new MimeMessage(session);
			 Transport ts = null;

			try {
				msg.setFrom(new InternetAddress("你的郵箱"));

				msg.setSubject("我是主題");

				msg.setContent("<span style='color:red'>我的文字是紅色的,想複雜自己加</span>", "text/html;charset=utf-8");

				msg.setRecipients(RecipientType.TO, InternetAddress.parse("張三的郵箱,李四的郵箱"));
				Transport.send(msg);
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //發件人


	}
	
	
	 /** Authorizes the installed application to access user's protected data. */
//	 private static Credential authorize() throws Exception {
//	   // load client secrets
//	   GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY,
//	       new InputStreamReader(CalendarSample.class.getResourceAsStream("/client_secrets.json")));
//	   // set up authorization code flow
//	   GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
//	       httpTransport, JSON_FACTORY, clientSecrets,
//	       Collections.singleton(CalendarScopes.CALENDAR)).setDataStoreFactory(dataStoreFactory)
//	      .build();
//	   // authorize
//	   return new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");
//	}
}
