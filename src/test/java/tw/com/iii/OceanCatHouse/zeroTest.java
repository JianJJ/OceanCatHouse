package tw.com.iii.OceanCatHouse;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.model.UserRepository;

@SpringBootTest
public class zeroTest {

	
	@Autowired
	private UserRepository userRepository;

	@Test
	public void AAA() {
		
		boolean exists =userRepository.existsByuserpassword("AdA");
		System.out.println(exists);
		
	}
}
