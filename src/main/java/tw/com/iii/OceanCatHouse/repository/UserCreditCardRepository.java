package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import tw.com.iii.OceanCatHouse.model.UserCreditCardBean;

import java.util.List;

public interface UserCreditCardRepository extends JpaRepository<UserCreditCardBean, Integer> {

    @Query("from UserCreditCardBean where userid=:userid")
    List<UserCreditCardBean> findAllByUserid (Integer userid);
}
