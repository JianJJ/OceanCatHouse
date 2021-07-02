package tw.com.iii.OceanCatHouse.controller;

import org.apache.jasper.compiler.JspUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import tw.com.iii.OceanCatHouse.Tool.ZeroTools;
import tw.com.iii.OceanCatHouse.ecpay.payment.integration.AllInOne;
import tw.com.iii.OceanCatHouse.ecpay.payment.integration.domain.AioCheckOutALL;
import tw.com.iii.OceanCatHouse.model.ProductBean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class ecpayController {

    @RequestMapping("ecpayOrder")
    @ResponseBody
    public String ecpayOrder(@RequestBody Map<String, String> map){
        String productNameStr = map.get("productNameStr");
        String total = map.get("total");
        AllInOne all = new AllInOne("");
        AioCheckOutALL obj = new AioCheckOutALL();
        SimpleDateFormat sdfNo = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String tradNO = sdfNo.format(new Date());
        obj.setMerchantTradeNo(tradNO);
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String tradDate = sdfDate.format(new Date());
        obj.setMerchantTradeDate(tradDate);
        obj.setTotalAmount(total);
        obj.setTradeDesc("訂單交易");
        obj.setItemName(productNameStr);
        obj.setReturnURL("http://211.23.128.214:5000");
        obj.setNeedExtraPaidInfo("N");
        obj.setExpireDate("3");
        String form = all.aioCheckOut(obj, null);
        return form;
    }

}
