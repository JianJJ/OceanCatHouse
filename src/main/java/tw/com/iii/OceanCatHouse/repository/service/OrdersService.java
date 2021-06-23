package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.OrderDetailBean;
import tw.com.iii.OceanCatHouse.model.OrdersBean;
import tw.com.iii.OceanCatHouse.repository.OrderDetailRepository;
import tw.com.iii.OceanCatHouse.repository.OrdersRepository;

import java.util.Map;

@Service
@Transactional
public class OrdersService {
    @Autowired
   private OrdersRepository ordersRepository;
    @Autowired
    private OrderDetailRepository orderDetailRepository;

    public OrdersBean insert(Integer id ,Map<String, Integer> cat){

        OrdersBean ordersBean = new OrdersBean();
        ordersBean.setUserid(id);
        ordersBean.setOrderstatusid(1);
        OrdersBean save = ordersRepository.save(ordersBean);
        System.out.println("orderid = "+save.getOrderid());

        for (String key : cat.keySet()){
            OrderDetailBean detailBean = new OrderDetailBean();
            detailBean.setOrderid(save.getOrderid());
            detailBean.setProductid(Integer.valueOf(key));
            detailBean.setUnit(cat.get(key));
            detailBean.setDiscount(1);
            orderDetailRepository.save(detailBean);
        }


        return save;
    }
}
