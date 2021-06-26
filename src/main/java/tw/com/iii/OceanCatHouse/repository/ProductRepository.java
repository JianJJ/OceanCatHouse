package tw.com.iii.OceanCatHouse.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.iii.OceanCatHouse.model.ProductBean;


public interface ProductRepository extends JpaRepository<ProductBean, Integer>{

	@Query("from ProductBean where productcategoryid = (select productcategoryid from ProductBean where productid = ?1)")
	List<ProductBean> findProductcategoryid(Integer id);
	List<ProductBean>  findByProductnameLike(String name);
	List<ProductBean>  findByProductcategoryid(Integer productcategoryid);
	Page<ProductBean>  findByProductcategoryid(Integer productcategoryid,Pageable pageable);
	Page<ProductBean> findByProductstatusAndAndProductcategoryid(String state,Integer productcategoryid,Pageable pageable);
	Page<ProductBean> findByProductstatus(String state,Pageable pageable);
	ProductBean findByProductidAndProductcategoryid(Integer Productid,Integer Productcategoryid);

	boolean existsByProductmodel(String Productmodel);

}