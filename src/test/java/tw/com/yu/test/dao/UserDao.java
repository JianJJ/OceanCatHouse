package tw.com.yu.test.dao;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iii.OceanCatHouse.model.UserBean;


@SpringBootTest
public interface UserDao extends JpaRepository<UserBean, String>  {
	
	
		
	
	
	
	
}
