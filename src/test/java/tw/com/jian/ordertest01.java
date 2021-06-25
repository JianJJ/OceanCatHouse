package tw.com.jian;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import tw.com.iii.OceanCatHouse.OceanCatHouseApplication;
import tw.com.iii.OceanCatHouse.model.OrderDetailBean;
import tw.com.iii.OceanCatHouse.model.OrdersBean;
import tw.com.iii.OceanCatHouse.model.UserBean;
import tw.com.iii.OceanCatHouse.repository.OrderDetailRepository;
import tw.com.iii.OceanCatHouse.repository.OrdersRepository;
import tw.com.iii.OceanCatHouse.repository.UserRepository;

import java.util.List;
import java.util.Optional;

@SpringBootTest(classes = OceanCatHouseApplication.class)
public class ordertest01 {

    @Autowired
    private UserRepository userDao;

    @Autowired
    private OrdersRepository ordersDao;

    @Autowired
    private OrderDetailRepository orderDetailDao;

    @Test
    public void select(){

//        Optional<UserBean> byId = userDao.findById(21);
//        UserBean user = byId.get();
//
//        List<OrdersBean> byUserid = ordersDao.findByUserid(user.getUserid());
//
//        for(OrdersBean apple : byUserid){
//            System.out.println(apple.getOrderStatusBean().getStatusname());
//            List<OrderDetailBean> orderDetailBeanList = apple.getOrderDetailBeanList();
//            for (OrderDetailBean bee : orderDetailBeanList){
//                System.out.println(bee);
//            }
//        }
        OrdersBean ordersBean = new OrdersBean();
        ordersBean.setUserid(21);
        ordersBean.setAddress("蘋果");
        ordersBean.setOrderstatusid(1);


        OrderDetailBean orderDetailBean = new OrderDetailBean();
        orderDetailBean.setProductid(4);

        ordersBean.getOrderDetailBeans().add(orderDetailBean);
        orderDetailBean.setOrdersBean(ordersBean);

//        ordersDao.save(ordersBean);

        orderDetailDao.save(orderDetailBean);
    }
}
