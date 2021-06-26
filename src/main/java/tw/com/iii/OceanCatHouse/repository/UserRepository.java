package tw.com.iii.OceanCatHouse.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.model.UserFavoritesBean;


public interface UserRepository extends JpaRepository<UserBean, Integer>{

	boolean existsByuserpassword(String password);
	boolean existsByemail(String password);
	boolean existsByuserphone(String userphone);
	@Transactional
	UserBean findByemail(String email);
	UserBean findByUserphone(String Userphone);
	@Query( "FROM UserBean WHERE userpassword = ?1 and email = ?2")
	UserBean findPasswordByEmail(String password,String email);

	@Query( "FROM UserBean WHERE userpassword = ?1 and userphone = ?2")
	UserBean findPasswordByUserPhone(String password,String userphone);
	@Query( "FROM UserBean WHERE userid = ?1 and userpassword = ?2")
	UserBean findUserByUserIdAndPassword(Integer id,String password);

}
