package tw.com.iii.OceanCatHouse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tw.com.iii.OceanCatHouse.ecpay.payment.integration.AllInOne;
import tw.com.iii.OceanCatHouse.ecpay.payment.integration.domain.AioCheckOutALL;
import tw.com.iii.OceanCatHouse.ecpay.payment.integration.domain.AioCheckOutATM;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class ecpayController {

    @RequestMapping("ecpayOrder")
    @ResponseBody
    public String ecpayOrder(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String TradNO = sdf.format(new Date());

        AllInOne all = new AllInOne("");
        AioCheckOutALL obj = new AioCheckOutALL();
        obj.setMerchantTradeNo(TradNO);
        obj.setMerchantTradeDate("2021/06/30 21:50:23");
        obj.setTotalAmount("50");
        obj.setTradeDesc("test Description");
        obj.setItemName("TestItem");
        obj.setReturnURL("http://211.23.128.214:5000");
        obj.setNeedExtraPaidInfo("N");
        obj.setExpireDate("6");

        String form = all.aioCheckOut(obj, null);
        return form;
    }

}
