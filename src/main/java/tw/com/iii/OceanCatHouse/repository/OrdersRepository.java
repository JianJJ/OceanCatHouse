package tw.com.iii.OceanCatHouse.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import tw.com.iii.OceanCatHouse.model.OrdersBean;

public interface OrdersRepository extends JpaRepository<OrdersBean, Integer> {
}
