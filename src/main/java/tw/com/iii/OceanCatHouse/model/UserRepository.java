package tw.com.iii.OceanCatHouse.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserBean, Integer>{

	boolean existsByuserpassword(String password);
	boolean existsByemail(String password);
}
