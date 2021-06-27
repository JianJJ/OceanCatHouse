package tw.com.iii.OceanCatHouse.repository.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import tw.com.iii.OceanCatHouse.model.*;
import tw.com.iii.OceanCatHouse.repository.RecipeCategoryRepository;
import tw.com.iii.OceanCatHouse.repository.RecipeMaterialRepository;
import tw.com.iii.OceanCatHouse.repository.RecipeStepRepository;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Transactional
public class RecipeCategoryService {

    @Autowired
    private RecipeCategoryRepository categoryRepositoryDao;

    public List<RecipeCategoryBean> list(){
        List<RecipeCategoryBean> categoryList = categoryRepositoryDao.findAll();
        return categoryList;
    }
}
