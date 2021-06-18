package tw.com.iii.OceanCatHouse;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;

import tw.com.iii.OceanCatHouse.model.OrdersBean;
import tw.com.iii.OceanCatHouse.repository.OrdersRepository;
import tw.com.iii.OceanCatHouse.repository.UserRepository;

import org.json.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class zeroTest {


	@Autowired
	private OrdersRepository ordersRepository;

	@Autowired
	private UserRepository userRepository;
	

	@Test
	public void AAA() {
		List<OrdersBean>  re =   ordersRepository.findAll();
		System.out.println(re);
	}
}
