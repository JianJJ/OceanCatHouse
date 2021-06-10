package tw.com.iii.OceanCatHouse.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface UserRepository extends JpaRepository<UserBean, Integer>{

	boolean existsByuserpassword(String password);
	boolean existsByemail(String password);
	boolean existsByuserphone(String userphone);
	@Query( "FROM UserBean WHERE userpassword = ?1 and email = ?2")
	UserBean findPasswordByEmail(String password,String email);
	@Query( "FROM UserBean WHERE userpassword = ?1 and userphone = ?2")
	UserBean findPasswordByUserPhone(String password,String userphone);
}
