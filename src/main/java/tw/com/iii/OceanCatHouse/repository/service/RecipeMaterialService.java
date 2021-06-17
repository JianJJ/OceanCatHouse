package tw.com.iii.OceanCatHouse.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.com.iii.OceanCatHouse.repository.RecipeMaterialRepository;

@Service
@Transactional
public class RecipeMaterialService {

    @Autowired
    private RecipeMaterialRepository recipeMaterialDao;

}
