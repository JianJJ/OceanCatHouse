package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.OrderDetailBean;
import tw.com.iii.OceanCatHouse.repository.OrderDetailRepository;

@Service
@Transactional
public class OrderDetailService {
    @Autowired
   private OrderDetailRepository orderDetailRepository;
}
