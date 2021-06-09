package tw.com.iii.OceanCatHouse;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.iii.OceanCatHouse.model.UserRepository;


import javax.mail.*;
import javax.mail.internet.*;

import java.util.Properties;

@SpringBootTest
public class zeroTest {

	
	@Autowired
	private UserRepository userRepository;

	@Test
	public void AAA() {
        Properties prop = new Properties();
        // 發件人的郵箱的SMTP 服務器地址（不同的郵箱，服務器地址不同，如139和qq的郵箱服務器地址不同）
        prop.setProperty("mail.host", "smtp.gmail.com");
        // 使用的協議（JavaMail規範要求）
        prop.setProperty("mail.transport.protocol", "smtp");
        // 需要請求認證
        prop.setProperty("mail.smtp.auth", "true");
      
        
        prop.put("mail.smtp.starttls.enable", "true");

        prop.put("mail.smtp.port", "587");     
        // 使用JavaMail發送郵件的5個步驟
        // 1、創建session
        Session session = Session.getInstance(prop);
        // 開啟Session的debug模式，這樣就可以查看到程序發送Email的運行狀態
        session.setDebug(true);
        Transport ts = null;
        try {
            // 2、通過session得到transport對象
            ts = session.getTransport();
            // 3、使用郵箱的用戶名和密碼連接郵件服務器（不同類型的郵箱不一樣，網易郵箱輸入的是用戶名和密碼，這裏我用的qq郵箱，輸入的是郵箱用戶名和smtp授權碼，smtp授權碼可登陸郵箱，進入設置啟動smtp服務後獲取）
            // 發送郵件時，發件人需要提交郵箱的用戶名和密碼給smtp服務器，用戶名和密碼都通過驗證之後才能夠正常發送郵件給收件人。
            ts.connect("smtp.gmail.com", "wiz71029@gmail.com", "  ");
            // 4、創建郵件
//            Message message = createComplexMail(session); 
            MimeMessage message = new MimeMessage(session);
            // 指明發件人
            message.setFrom(new InternetAddress("wiz71029@gmail.com"));
            // 指明收件人
            message.setRecipient(Message.RecipientType.TO, new InternetAddress("wiz71029@gmail.com"));
            // 郵件的標題
            message.setSubject("通知");
         // 郵件的文本內容
            message.setContent("<a href=\"/recipe/views/forget\">忘記密碼?</a><br> <br> <br> <span>還沒有帳號?", "text/html;charset=UTF-8");
//            message.setText("Hello, this is sample for to check send "
//                    + "email using JavaMailAPI ");
            // 5、發送郵件
            
            ts.sendMessage(message, message.getAllRecipients());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // 關閉transport對象
                ts.close();
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }




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
