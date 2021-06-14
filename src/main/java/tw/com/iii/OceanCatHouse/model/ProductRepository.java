package tw.com.iii.OceanCatHouse.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface ProductRepository extends JpaRepository<ProductBean, Integer>{

	@Query("from ProductBean where productcategoryid = (select productcategoryid from ProductBean where productid = ?1)")
	List<ProductBean> findProductcategoryid(Integer id);
//	@Query("from ProductBean where Productcategoryid = ?1")
//	List<ProductBean> findCategory(Integer id);
	
	List<ProductBean>  findByProductcategoryid(Integer productcategoryid);
	Page<ProductBean>  findByProductcategoryid(Integer productcategoryid,Pageable pageable); 
}