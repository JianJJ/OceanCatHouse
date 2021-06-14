package tw.com.yu.test;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;

import com.jayway.jsonpath.Option;

import tw.com.iii.OceanCatHouse.OceanCatHouseApplication;
import tw.com.iii.OceanCatHouse.ServletInitializer;
import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.model.UserRepository;


@SpringBootTest(classes = OceanCatHouseApplication.class)
public class Test01 {

	@Autowired
	UserRepository userDao;

//	測試JPA增刪修查
	//測試新增
//	@Test
//	void addUser() {
//		System.out.println("添加使用者中...");
//		UserBean user = new UserBean();
//
//		user.setUsername("游先生");
//		user.setEmail("yu@dean.tw");
//		user.setUserpassword("yu20210613");
//		user.setUserphone("0920210613");
//		System.err.println("已成功添加數據");
//		userDao.save(user);
//	}
//	
	//測試查詢
	@Test
	void selectUser() {
		
		//1. findByID根據ID查
//		Optional<UserBean> optional = userDao.findById(30);
//		UserBean user = optional.get();
//		String userName =  user.getUsername() ;
//		String eMail =  user.getEmail() ;
//		String passWord = user.getUserpassword() ;
//		System.out.printf("客戶姓名:%s%n信箱:%s%n密碼:%s%n",userName,eMail ,passWord);
		
		//2.findAll(全部查)
		
//		List<UserBean> users =  userDao.findAll();
//		for(UserBean user : users) {
//			System.out.println(user.getUsername());
//		}
				//根據索引查詢(欄位名稱)
		List<UserBean> emails =  userDao.findAll(Sort.by("email"));
		List<UserBean> users =  userDao.findAll(Sort.by("username"));
				
//		for(int i = 0; i < users.size();i++) {
//			String userName = (String)users.get(i) ;
//			
//			System.out.println(+ ":" + emails.get(i));
//		}
		
//		for(UserBean user : users) {
//			System.out.println(user);
//		}
			for(UserBean email : emails) {
			System.out.println(email);
		}
						
	}
	
	
	
	
	

}
