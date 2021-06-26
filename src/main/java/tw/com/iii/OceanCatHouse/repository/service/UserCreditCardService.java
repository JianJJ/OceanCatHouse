package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.UserCreditCardBean;
import tw.com.iii.OceanCatHouse.repository.UserCreditCardRepository;

@Service
@Transactional
public class UserCreditCardService {

    @Autowired
    private UserCreditCardRepository userCreditCardDao;

}
