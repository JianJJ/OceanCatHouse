package tw.com.iii.OceanCatHouse.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	
	private String STMP ="";
	
	public void setMail(String mailTo,String text) {
		
		 mailTo = "wiz71029@gmail.com";
		
		
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
//            Message message = createComplexMail(session); 
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
	
	
	

}
