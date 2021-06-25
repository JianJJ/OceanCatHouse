package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;


@Entity
@Table(name = "product")
public class ProductBean{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productid;
	private String productmodel;
	private String productname;
	private String producttext;
	private Integer purchaseprice;
	private Integer sellingprice;
	private Integer stocks;
	private String productspecifications;
	private java.util.Date createdon;
	private java.util.Date lastupdatedon;
	private Integer productcategoryid;
	private String productstatus;
	private  String productkey;

	@JsonIgnore
	@OneToMany(mappedBy = "productBean", cascade = CascadeType.ALL)
	private List<OrderDetailBean> orderDetailBeans;

	@Override
	public String toString() {
		return "ProductBean{" +
				"productid=" + productid +
				", productmodel='" + productmodel + '\'' +
				", productname='" + productname + '\'' +
				", producttext='" + producttext + '\'' +
				", purchaseprice=" + purchaseprice +
				", sellingprice=" + sellingprice +
				", stocks=" + stocks +
				", productspecifications='" + productspecifications + '\'' +
				", createdon=" + createdon +
				", lastupdatedon=" + lastupdatedon +
				", productcategoryid=" + productcategoryid +
				", productstatus='" + productstatus + '\'' +
				", productkey='" + productkey + '\'' +
				", orderDetailBeans=" + orderDetailBeans +
				", vendorid=" + vendorid +
				'}';
	}

	public List<OrderDetailBean> getOrderDetailBeans() {
		return orderDetailBeans;
	}

	public void setOrderDetailBeans(List<OrderDetailBean> orderDetailBeans) {
		this.orderDetailBeans = orderDetailBeans;
	}

	public String getProductkey() {
		return productkey;
	}

	public void setProductkey(String productkey) {
		this.productkey = productkey;
	}

	private Integer  vendorid;
	public Integer getProductid() {
		return productid;
	}
	public void setProductid(Integer productid) {
		this.productid = productid;
	}
	public String getProductmodel() {
		return productmodel;
	}
	public void setProductmodel(String productmodel) {
		this.productmodel = productmodel;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getProducttext() {
		return producttext;
	}
	public void setProducttext(String producttext) {
		this.producttext = producttext;
	}
	public Integer getPurchaseprice() {
		return purchaseprice;
	}
	public void setPurchaseprice(Integer purchaseprice) {
		this.purchaseprice = purchaseprice;
	}
	public Integer getSellingprice() {
		return sellingprice;
	}
	public void setSellingprice(Integer sellingprice) {
		this.sellingprice = sellingprice;
	}
	public Integer getStocks() {
		return stocks;
	}
	public void setStocks(Integer stocks) {
		this.stocks = stocks;
	}
	public String getProductspecifications() {
		return productspecifications;
	}
	public void setProductspecifications(String productspecifications) {
		this.productspecifications = productspecifications;
	}
	public java.util.Date getCreatedon() {
		return createdon;
	}
	public void setCreatedon(java.util.Date createdon) {
		this.createdon = createdon;
	}
	public java.util.Date getLastupdatedon() {
		return lastupdatedon;
	}
	public void setLastupdatedon(java.util.Date lastupdatedon) {
		this.lastupdatedon = lastupdatedon;
	}
	public Integer getVendorid() {
		return vendorid;
	}
	public void setVendorid(Integer vendorid) {
		this.vendorid = vendorid;
	}
	public Integer getProductcategoryid() {
		return productcategoryid;
	}
	public void setProductcategoryid(Integer productcategoryid) {
		this.productcategoryid = productcategoryid;
	}
	public String getProductstatus() {
		return productstatus;
	}
	public void setProductstatus(String productstatus) {
		this.productstatus = productstatus;
	}
}
