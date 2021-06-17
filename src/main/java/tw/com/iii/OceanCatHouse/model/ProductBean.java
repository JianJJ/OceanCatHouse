package tw.com.iii.OceanCatHouse.model;

import javax.persistence.*;


@Entity
@Table(name = "product")

public class ProductBean {
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
	@Override
	public String toString() {
		return "ProductBean [productmodel=" + productmodel + ", productname=" + productname + ", sellingprice="
				+ sellingprice + "]";
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
	private Integer productcategoryid;
	private String productstatus;


}
