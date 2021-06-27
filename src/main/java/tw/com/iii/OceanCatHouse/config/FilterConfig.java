package tw.com.iii.OceanCatHouse.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import tw.com.iii.OceanCatHouse.filter.UserFilter;

@Configuration
public class FilterConfig {

    @Bean
    public FilterRegistrationBean myFilterRegistrationBean(){
        // 註冊過濾器
        FilterRegistrationBean filterRegistrationBean =
                new FilterRegistrationBean(new UserFilter());

        // 添加過濾路徑
        filterRegistrationBean.addUrlPatterns("/userBack/*");
        filterRegistrationBean.addUrlPatterns("/addPay");
        filterRegistrationBean.addUrlPatterns("/insertOrder");
        filterRegistrationBean.addUrlPatterns("/toAddress");
        filterRegistrationBean.addUrlPatterns("/cat/*");

        return filterRegistrationBean;
    }
}