package tw.com.iii.OceanCatHouse.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.json.JSONObject;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.security.PrivateKey;
import java.util.Date;

// @NoArgsConstructor  無參建構
// @AllArgsConstructor 有參建構
@ToString
@Data
@Entity
@Table(name = "`recipe_main`")
public class RecipeBean {

    @Id
    private Integer RecId;
    private Integer RecCategory;
    private String RecTitle;
    private String RecPic;
    private String RecText;
    private Integer RecTime;
    private Integer RecNum;
    private Integer RecCal;
    private String RecTag;
    private Integer UserId;
    private Integer RecLiked;
    private Date RecCreated;
    private Integer RecViews;
    
    
	public Integer getRecId() {
		return RecId;
	}
	public void setRecId(Integer recId) {
		RecId = recId;
	}
	public Integer getRecCategory() {
		return RecCategory;
	}
	public void setRecCategory(Integer recCategory) {
		RecCategory = recCategory;
	}
	public String getRecTitle() {
		return RecTitle;
	}
	public void setRecTitle(String recTitle) {
		RecTitle = recTitle;
	}
	public String getRecPic() {
		return RecPic;
	}
	public void setRecPic(String recPic) {
		RecPic = recPic;
	}
	public String getRecText() {
		return RecText;
	}
	public void setRecText(String recText) {
		RecText = recText;
	}
	public Integer getRecTime() {
		return RecTime;
	}
	public void setRecTime(Integer recTime) {
		RecTime = recTime;
	}
	public Integer getRecNum() {
		return RecNum;
	}
	public void setRecNum(Integer recNum) {
		RecNum = recNum;
	}
	public Integer getRecCal() {
		return RecCal;
	}
	public void setRecCal(Integer recCal) {
		RecCal = recCal;
	}
	public String getRecTag() {
		return RecTag;
	}
	public void setRecTag(String recTag) {
		RecTag = recTag;
	}
	public Integer getUserId() {
		return UserId;
	}
	public void setUserId(Integer userId) {
		UserId = userId;
	}
	public Integer getRecLiked() {
		return RecLiked;
	}
	public void setRecLiked(Integer recLiked) {
		RecLiked = recLiked;
	}
	public Date getRecCreated() {
		return RecCreated;
	}
	public void setRecCreated(Date recCreated) {
		RecCreated = recCreated;
	}
	public Integer getRecViews() {
		return RecViews;
	}
	public void setRecViews(Integer recViews) {
		RecViews = recViews;
	}
	
	
	@Override
	public String toString() {
		return "RecipeBean [RecId=" + RecId + ", RecCategory=" + RecCategory + ", RecTitle=" + RecTitle + ", RecPic="
				+ RecPic + ", RecText=" + RecText + ", RecTime=" + RecTime + ", RecNum=" + RecNum + ", RecCal=" + RecCal
				+ ", RecTag=" + RecTag + ", UserId=" + UserId + ", RecLiked=" + RecLiked + ", RecCreated=" + RecCreated
				+ ", RecViews=" + RecViews + "]";
	}
    
    
    
}
