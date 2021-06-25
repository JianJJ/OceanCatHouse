package tw.com.iii.OceanCatHouse.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import tw.com.iii.OceanCatHouse.model.OrdersBean;

import java.util.List;

public interface OrdersRepository extends JpaRepository<OrdersBean, Integer> {

    List<OrdersBean> findByUserid(Integer userId);

    @Query("from OrdersBean where userid=?1 order by ordercreateon DESC")
    List<OrdersBean> findByUseridOrderByOrdercreateonDesc(Integer userid);
}
