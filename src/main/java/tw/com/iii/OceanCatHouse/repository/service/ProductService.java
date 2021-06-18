package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.model.ProductBean;
import tw.com.iii.OceanCatHouse.repository.ProductRepository;

@Service
@Transactional
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public ProductBean insert(ProductBean bean){
        ProductBean save =null;
        if(bean != null)
         save  = productRepository.save(bean);
        return save;
    }

}
