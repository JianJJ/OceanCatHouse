package tw.com.iii.OceanCatHouse.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="user")
public class UserBean {
	
	private Integer userid;
	private Integer fansnum;//分屍數
	private Integer recnum;//案戰術
	private String username;
	private String userpic;
	private String userphone;
	@Id
	private String email;
	private String userpassword;
	
	
	
	

	@Override
	public String toString() {
		return "UserBean [username=" + username + ", email=" + email + ", userpassword=" + userpassword + "]";
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getFansnum() {
		return fansnum;
	}
	public void setFansnum(Integer fansnum) {
		this.fansnum = fansnum;
	}
	public Integer getRecnum() {
		return recnum;
	}
	public void setRecnum(Integer recnum) {
		this.recnum = recnum;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpic() {
		return userpic;
	}
	public void setUserpic(String userpic) {
		this.userpic = userpic;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	


}
