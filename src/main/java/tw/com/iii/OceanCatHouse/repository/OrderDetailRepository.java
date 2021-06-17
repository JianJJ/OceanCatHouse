package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tw.com.iii.OceanCatHouse.model.OrderDetailBean;

public interface OrderDetailRepository extends JpaRepository<OrderDetailBean, Integer> {
}
