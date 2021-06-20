package tw.com.iii.OceanCatHouse.model;

import javax.persistence.*;

@Entity
@Table(name = "product_picture")

public class ProductPictureBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Productpictureid;
	private Integer Productid;
	private String Producturl;
	
	@Override
	public String toString() {
		return "productPictureBean [Productpictureid=" + Productpictureid + ", Productid=" + Productid + ", Producturl="
				+ Producturl + "]";
	}
	public Integer getProductpictureid() {
		return Productpictureid;
	}
	public void setProductpictureid(Integer productpictureid) {
		Productpictureid = productpictureid;
	}
	public Integer getProductid() {
		return Productid;
	}
	public void setProductid(Integer productid) {
		Productid = productid;
	}
	public String getProducturl() {
		return Producturl;
	}
	public void setProducturl(String producturl) {
		Producturl = producturl;
	}
	
}
