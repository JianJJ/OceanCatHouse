package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tw.com.iii.OceanCatHouse.model.OrderDetailBean;

import java.util.List;

public interface OrderDetailRepository extends JpaRepository<OrderDetailBean, Integer> {

    List<OrderDetailBean> findByorderid(Integer orderid);

}
