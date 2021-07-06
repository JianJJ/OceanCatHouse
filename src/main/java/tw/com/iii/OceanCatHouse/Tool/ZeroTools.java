package tw.com.iii.OceanCatHouse.Tool;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;

import java.net.URL;

import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import org.json.JSONObject;
import org.springframework.stereotype.Component;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;

@Component
public class ZeroTools {

private String STMP = "";
    private String secret ="";

    //郵件
    public void mail(String mailTo, String text) {
//		mailTo = "wiz71029@gmail.com";
        new Thread() {
            @Override
            public void run() {


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
                    // 3、使用郵箱的用戶名和密碼連接郵件服務器
                    // 發送郵件時，發件人需要提交郵箱的用戶名和密碼給smtp服務器，用戶名和密碼都通過驗證之後才能夠正常發送郵件給收件人。
                    ts.connect("smtp.gmail.com", "wiz71029@gmail.com", STMP);
                    // 4、創建郵件
//	            Message message = createComplexMail(session); 
                    MimeMessage message = new MimeMessage(session);
                    // 指明發件人
                    message.setFrom(new InternetAddress("wiz71029@gmail.com"));
                    // 指明收件人
                    message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailTo));
                    // 郵件的標題
                    message.setSubject("通知");
                    // 郵件的文本內容
                    message.setContent(text, "text/html;charset=UTF-8");

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
        }.start();

    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //google登入
    public void oauth(String idtoken) {
        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), new GsonFactory())
                // Specify the CLIENT_ID of the app that accesses the backend:
                .setAudience(Collections.singletonList("849367464998-0c4najofsqmh3rteejq2dc3va9iqdps2.apps.googleusercontent.com"))
                // Or, if multiple clients access the backend:
                //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
                .build();

        // (Receive idTokenString by HTTPS POST)

        GoogleIdToken idToken = null;
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


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

    //機器人判斷
    public boolean recaptcha(String toke) {

        //取得token
        System.out.println(toke);
        System.out.println("*****recaptcha******");

//		JSONObject obj = new JSONObject();
//		obj.put("secret", "");
//		obj.put("response", body);
//		obj.put("remoteip", ip);
        try {
            //編輯google需要文件
            String url = "https://www.google.com/recaptcha/api/siteverify",
                    params = "secret=" + secret + "&response=" + toke;
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
            if ((boolean) json.get("success")) {
                return true;
            }
            return false;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }
}
