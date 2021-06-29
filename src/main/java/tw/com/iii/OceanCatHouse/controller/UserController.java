package tw.com.iii.OceanCatHouse.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import tw.com.iii.OceanCatHouse.Tool.ZeroTools;
import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.repository.UserRepository;

@Controller
public class UserController {
    @GetMapping(path = {"/views/phoneLogin"})
    public String index() {
        return "views/user/phoneLogin";
    }

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ZeroTools zTools;

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //忘記密碼
    @RequestMapping("/forget/{controller}")
    public String forget(UserBean bean, Model model, Locale locale, HttpSession session,
                         @RequestParam("g-recaptcha-response") String token) {
        System.out.println("*****forget******");
        System.out.println(bean);
        Map<String, String> errors = new HashMap<>();
        model.addAttribute("errors", errors);
        model.addAttribute("email", bean.getEmail());
        // 機器人判斷
        if (token == "" || !zTools.recaptcha(token)) {
            System.out.println("errors.put(\"recaptcha\", \"需要驗證\");");
            errors.put("recaptcha", "需要驗證");
        }
        // 郵件格式判斷
        if (bean.getEmail() == null || bean.getEmail().length() == 0) {
            errors.put("email", "Email錯誤");
//			return "/views/forget";
        }
        if (!bean.getEmail().contains("@"))
            errors.put("email", "Email錯誤");

        if (errors != null && !errors.isEmpty())
            return "views/user/forget";

        // 寄發郵件
        String text = "<p><a href='http://wizard71029.synology.me:7070/AAA'>從新設定密碼</a></p>";


        bean.setEmail("wiz710329@gmail.com");
        zTools.mail(bean.getEmail(), text);
        return "index2";
    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //登入檢查
    @RequestMapping("/signup/{action}")
    public String signup(UserBean bean, Model model, Locale locale, @PathVariable("action") String action,
                         HttpSession session, @RequestParam("g-recaptcha-response") String token) {

        System.out.println(token);
        System.out.println("*****" + action + "******");
        System.out.println(bean);// 接收input

        boolean recaptcha = zTools.recaptcha(token);// 機器人判斷
        //使有輸入的資料能返回
        model.addAttribute("email", bean.getEmail());
        model.addAttribute("username", bean.getUsername());
        model.addAttribute("userpassword", bean.getUserpassword());
        model.addAttribute("userphone", bean.getUserphone());
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
            if (action.equals("phoneLogin"))
                errors.put("userphone", "沒有手機號碼");
        }
        if (bean.getEmail() == null || bean.getEmail().length() == 0) {
            if (action.equals("login") || action.equals("signup"))
                errors.put("email", "沒有Email");
        }
        if (bean.getUsername() == null || bean.getUsername().length() == 0) {
            if (action.equals("signup"))
                errors.put("username", "沒有暱稱");
        }
        if (bean.getUserpassword() == null || bean.getUserpassword().length() == 0) {
            errors.put("userpassword", "沒有密碼");
        }

        if (errors != null && !errors.isEmpty()) {
            System.out.println("errors");
            if (action.equals("login")) {
                return "views/user/login";
            } else if (action.equals("signup")) {
                return "views/user/signup";
            } else {
                return "views/user/phoneLogin";
            }

        }
        // 登入 判斷email,密碼是否正確
        if (action != null && action.equals("login")) {
            if (userRepository.existsByemail(bean.getEmail())) {

                if (userRepository.findPasswordByEmail(bean.getUserpassword(), bean.getEmail()) != null) {
                    System.out.println("登入成功*************************");
                    bean = userRepository.findByemail(bean.getEmail());
                    session.setAttribute("state", bean.getState());
                    session.setAttribute("user", bean);
                    return "index";
                } else {
                    System.out.println("密碼錯誤");
                    errors.put("userpassword", "密碼錯誤");
                    return "/views/user/" + action;
                }

            } else {
                System.out.println("Email錯誤");
                errors.put("email", "Email錯誤");
                return "/views/user/" + action;
            }

        }
        // 註冊 判斷email是否重複
        if (action != null && action.equals("signup")) {
            if (!userRepository.existsByemail(bean.getEmail())) {
                if (!userRepository.existsByuserpassword(bean.getUsername())) {
                    System.out.println("存資料");

                    //發送註冊信
                    String text = "<p><a href='http://wizard71029.synology.me:7070/AAA'>海貓食屋歡迎你,點擊認證 </a></p>";
                    zTools.mail(bean.getEmail(), text);
                    bean.setState("1");
                    userRepository.save(bean);
                } else {
                    System.out.println("名稱已經存在");
                    errors.put("username", "名稱已經存在");
                    return "/views/user/" + action;
                }
            } else {
                System.out.println("Email重複");
                errors.put("email", "Email重複");
                return "/views/user/" + action;
            }
        }
        // 判斷電話
        if (action != null && action.equals("phoneLogin")) {
            if (userRepository.existsByuserphone(bean.getUserphone())) {
                if (userRepository.findPasswordByUserPhone(bean.getUserpassword(), bean.getUserphone()) == null) {
                    System.out.println("密碼錯誤");
                    errors.put("userpassword", "密碼錯誤");
                    return "/views/user/" + action;
                } else {
                    bean = userRepository.findByUserphone(bean.getUserphone());
                    session.setAttribute("state", bean.getState());
                    session.setAttribute("user", bean);
                    System.out.println("登入成功");
                }

            } else {
                System.out.println("電話錯誤");
                errors.put("userphone", "電話錯誤");
                return "/views/user/" + action;
            }

        }
        if(action.equals("cat")){
            session.setAttribute("id",bean.getUserid());
            return "/views/shop/address";
        }

        // 成功後去向
        if (action.equals("login")) {
            return "index";
        } else {
            return "index";
        }

    }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Google登入
    @ResponseBody
    @RequestMapping("/oauth")
    public String oauth(String idtoken,HttpSession session) {
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
                GoogleIdToken.Payload payload = idToken.getPayload();

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
                UserBean bean = new UserBean();
                bean.setEmail(email);
                if(userRepository.existsByemail(email) == true){
                  bean =  userRepository.findByemail(email);
                }else {
                    bean.setEmail(email);
                    bean.setUsername(name);
                    bean.setUserpassword("googleOauth");
                    bean.setUserpic(pictureUrl);
                    bean.setState("1");
                    userRepository.save(bean);
                }
                session.setAttribute("state", bean.getState());
                session.setAttribute("user", bean);


            } else {
                System.out.println("Invalid ID token.");
            }

        return "true";
    }
}


