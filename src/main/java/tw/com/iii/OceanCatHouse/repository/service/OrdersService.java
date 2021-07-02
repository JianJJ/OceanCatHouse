package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.*;
import tw.com.iii.OceanCatHouse.repository.OrderDetailRepository;
import tw.com.iii.OceanCatHouse.repository.OrdersRepository;
import tw.com.iii.OceanCatHouse.repository.UserCreditCardRepository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@Transactional
public class OrdersService {
    @Autowired
    private OrdersRepository ordersRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    private UserCreditCardRepository userCreditCardDao;

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
    public Integer insertOrder(UserBean user, Map<String, Integer> cat, List<ProductBean> productBeanList, Map<String, Object> payMap) {
        // 新增訂單
        OrdersBean ordersBean = new OrdersBean();
        ordersBean.setUserid(user.getUserid());
        ordersBean.setOrderstatusid(0);
        ordersBean.setAddress(user.getDeliveryAddress());
        ordersBean.setPaymentId((Integer) payMap.get("PaymentId"));
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

        //  , 信用卡結帳,
        int paymentId = (Integer)payMap.get("PaymentId");  // 1 = 信用卡
        int cardId = (Integer) payMap.get("cardId");       // cardId之前有的卡號
        // = 1 才是信用卡
        if(paymentId == 1){
            if(paymentId == 1 && cardId != 0){
                // 判斷上次結帳是否也是用這張, 不是的話將這張卡片設為最新使用
                Optional<UserCreditCardBean> byId = userCreditCardDao.findById(cardId);
                UserCreditCardBean userCreditCardBean = byId.get();
                // != 1 , 代表要更新這張卡片為最新使用的卡片
                if(userCreditCardBean.getUseCard() != 1) {
                    // 先把user的所有卡片改成0
                    userCreditCardDao.changeUsed(user.getUserid());
                    // 再將最新這張改成1
                    userCreditCardDao.saveUsedCard(cardId);
                }
            }else {
                // 先把user的所有卡片改成0
                userCreditCardDao.changeUsed(user.getUserid());
                // 這次結帳是使用新卡片, 儲存這張卡片
                Map<String, String> addCard = (Map<String, String>) payMap.get("addCard");
                UserCreditCardBean userCreditCardBean = new UserCreditCardBean();
                userCreditCardBean.setUserid(user.getUserid());
                userCreditCardBean.setCardName(addCard.get("userCardName"));
                userCreditCardBean.setCardNumberP1(addCard.get("cardNumberP1"));
                userCreditCardBean.setCardNumberP2(addCard.get("cardNumberP2"));
                userCreditCardBean.setCardNumberP3(addCard.get("cardNumberP3"));
                userCreditCardBean.setCardNumberP4(addCard.get("cardNumberP4"));
                userCreditCardBean.setExpireMonth(addCard.get(("expireMonth")));
                userCreditCardBean.setExpireYear((addCard.get("expireYear")));
                userCreditCardBean.setVerificationCode(addCard.get("checkNumber"));
                userCreditCardBean.setUseCard(1);
                userCreditCardDao.save(userCreditCardBean);
            }
        }

        return (Integer) payMap.get("PaymentId");
    }
}
