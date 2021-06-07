package tw.com.iii.OceanCatHouse.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="user")
public class UserBean {
	@Id
	private Integer Userid;
	private Integer Fansnum;//分屍數
	private Integer Recnum;//案戰術
	private String Username;
	private String Userpic;
	private String Userphone;
	private String Email;
	private String Userpassword;
	

	@Override
	public String toString() {
		return "UserBean [Userid=" + Userid + ", Username=" + Username + ", Userphone=" + Userphone + "]";
	}
	public Integer getUserid() {
		return Userid;
	}
	public void setUserid(Integer userid) {
		Userid = userid;
	}
	public Integer getFansnum() {
		return Fansnum;
	}
	public void setFansnum(Integer fansnum) {
		Fansnum = fansnum;
	}
	public String getUserpassword() {
		return Userpassword;
	}
	public void setUserpassword(String userpassword) {
		Userpassword = userpassword;
	}
	public Integer getRecnum() {
		return Recnum;
	}
	public void setRecnum(Integer recnum) {
		Recnum = recnum;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getUserpic() {
		return Userpic;
	}
	public void setUserpic(String userpic) {
		Userpic = userpic;
	}
	public String getUserphone() {
		return Userphone;
	}
	public void setUserphone(String userphone) {
		Userphone = userphone;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}

}
