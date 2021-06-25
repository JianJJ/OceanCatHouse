package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.OrderDetailBean;
import tw.com.iii.OceanCatHouse.model.OrdersBean;
import tw.com.iii.OceanCatHouse.model.ProductBean;
import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.repository.OrderDetailRepository;
import tw.com.iii.OceanCatHouse.repository.OrdersRepository;

import java.util.List;
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
            detailBean.setQuantity(cat.get(key));
            detailBean.setDiscount(1);
            orderDetailRepository.save(detailBean);
        }

        return save;
    }

    // -------------Jian : 送出訂單, 新增訂單 ------------------------
    public OrdersBean insertOrder(UserBean user, Map<String, Integer> cat, List<ProductBean> productBeanList) {
        OrdersBean ordersBean = new OrdersBean();
        ordersBean.setUserid(user.getUserid());
        ordersBean.setOrderstatusid(1);
        ordersBean.setAddress(user.getDeliveryAddress());
        OrderDetailBean orderDetailBean;
        for (ProductBean productBean : productBeanList){
            orderDetailBean = new OrderDetailBean();
            orderDetailBean.setProductid(productBean.getProductid());
            orderDetailBean.setSellingprice(productBean.getSellingprice());
            orderDetailBean.setQuantity(cat.get(String.valueOf(productBean.getProductid())));
            orderDetailBean.setDiscount(1);
            orderDetailBean.setOrdersBean(ordersBean);
            ordersBean.getOrderDetailBeans().add(orderDetailBean);
        }
        OrdersBean save = ordersRepository.save(ordersBean);
        return save;
    }
}
