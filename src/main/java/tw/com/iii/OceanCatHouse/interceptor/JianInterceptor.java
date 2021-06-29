package tw.com.iii.OceanCatHouse.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class JianInterceptor implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/userPic/**").addResourceLocations("file:C:/JavaFramework0524/JavaFramework/OceanCatHouse/src/main/resources/static/images/userPic/");
        registry.addResourceHandler("/images/mainpic/**").addResourceLocations("file:C:/JavaFramework0524/JavaFramework/OceanCatHouse/src/main/resources/static/images/mainpic/");
        registry.addResourceHandler("/images/stepPic/**").addResourceLocations("file:C:/JavaFramework0524/JavaFramework/OceanCatHouse/src/main/resources/static/images/stepPic/");
    }
}

