package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.UserCreditCardBean;

import java.util.List;

public interface UserCreditCardRepository extends JpaRepository<UserCreditCardBean, Integer> {

    @Query("from UserCreditCardBean where userid=:userid")
    List<UserCreditCardBean> findAllByUserid (Integer userid);

    @Transactional
    @Modifying
    @Query("update UserCreditCardBean set UseCard = 0 where userid = :userid")
    void changeUsed(Integer userid);

    @Transactional
    @Modifying
    @Query("update UserCreditCardBean set UseCard = 1 where CardId = :cardId")
    void saveUsedCard(Integer cardId);
}
