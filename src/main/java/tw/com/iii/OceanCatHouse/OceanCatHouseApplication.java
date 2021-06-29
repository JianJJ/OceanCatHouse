package tw.com.iii.OceanCatHouse;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
//@ImportResource("classpath:payment_conf.xml")
public class OceanCatHouseApplication {

	public static void main(String[] args) {
		SpringApplication.run(OceanCatHouseApplication.class, args);
	}

}