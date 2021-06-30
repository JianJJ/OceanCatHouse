package tw.com.iii.OceanCatHouse.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class JianInterceptor implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/userPic/**").addResourceLocations("file:C:\\OceanCatHouse\\OceanCatHouse\\src\\main\\resources\\static\\images\\userPic\\");
        registry.addResourceHandler("/images/mainpic/**").addResourceLocations("file:C:\\OceanCatHouse\\OceanCatHouse\\src\\main\\resources\\static\\images\\mainpic\\");
        registry.addResourceHandler("/images/stepPic/**").addResourceLocations("file:C:\\OceanCatHouse\\OceanCatHouse\\src\\main\\resources\\static\\images\\stepPic\\");
        registry.addResourceHandler("/images/shop/**").addResourceLocations("file:C:\\OceanCatHouse\\OceanCatHouse\\src\\main\\resources\\static\\images\\shop\\");
    }
}

