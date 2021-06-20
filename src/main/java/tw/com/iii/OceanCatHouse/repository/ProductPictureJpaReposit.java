package tw.com.iii.OceanCatHouse.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.iii.OceanCatHouse.model.ProductPictureBean;

public interface ProductPictureJpaReposit extends JpaRepository<ProductPictureBean, Integer>{
	
	@Query("from ProductPictureBean where Productid = ?1")
	List<ProductPictureBean> findPic(Integer Productid);

	@Query("from ProductPictureBean where Producturl = ?1")
		ProductPictureBean findProducturl(String  Producturl);

}
