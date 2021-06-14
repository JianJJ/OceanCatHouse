package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

// @NoArgsConstructor  無參建構
// @AllArgsConstructor 有參建構
@ToString
@Data
@Entity
@Table(name = "`recipe_main`")
public class RecipeBean {

    @Id
    private Integer RecId;
    private Integer CategoryId;
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
	public Integer getCategoryId() {
		return CategoryId;
	}
	public void setCategoryId(Integer recCategory) {
		CategoryId = recCategory;
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
		return "RecipeBean [RecId=" + RecId + ", RecCategory=" + CategoryId + ", RecTitle=" + RecTitle + ", RecPic="
				+ RecPic + ", RecText=" + RecText + ", RecTime=" + RecTime + ", RecNum=" + RecNum + ", RecCal=" + RecCal
				+ ", RecTag=" + RecTag + ", UserId=" + UserId + ", RecLiked=" + RecLiked + ", RecCreated=" + RecCreated
				+ ", RecViews=" + RecViews + "]";
	}
    
    
    


    // 配置一對多 (Material表, Step表)
//    @JsonIgnore
//    @OneToMany(mappedBy = "recipeBean", cascade = CascadeType.ALL) // 放棄外鍵維護權, 開啟級聯操作
//    private Set<RecipeStepBean> recipeStepBeans = new HashSet<>();
//
//    // 配置多對一 (Category表)
//    @ManyToOne(targetEntity = RecipeCategoryBean.class)
//    @JoinColumn(name = "CategoryId", referencedColumnName = "CategoryId",insertable = false, updatable = false)  // 外鍵關係設置
//    private RecipeCategoryBean recipeCategoryBean;

}
