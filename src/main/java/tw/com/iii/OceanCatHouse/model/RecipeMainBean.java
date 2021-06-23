package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

// @NoArgsConstructor  無參建構
// @AllArgsConstructor 有參建構

@Entity
@Table(name = "recipe_main")
public class RecipeMainBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer RecId;
    private Integer CategoryId;
    private String RecTitle;
    private String RecPic;
    private String RecText;
    private String RecTime;
    private String RecNum;
    private Integer RecCal;
    private String RecTag;
    private Integer UserId;
    private Integer RecLiked;
    private String RecCreated;
    private Integer RecViews;
    private Integer RecStatus;


    public Integer getRecId() {
        return RecId;
    }

    public void setRecId(Integer recId) {
        RecId = recId;
    }

    public Integer getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(Integer categoryId) {
        CategoryId = categoryId;
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

    public String getRecTime() {
        return RecTime;
    }

    public void setRecTime(String recTime) {
        RecTime = recTime;
    }

    public String getRecNum() {
        return RecNum;
    }

    public void setRecNum(String recNum) {
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

    public String getRecCreated() {
        return RecCreated;
    }

    public void setRecCreated(String recCreated) {
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
        return "RecipeMainBean{" +
                "RecId=" + RecId +
                ", CategoryId=" + CategoryId +
                ", RecTitle='" + RecTitle + '\'' +
                ", RecPic='" + RecPic + '\'' +
                ", RecText='" + RecText + '\'' +
                ", RecTime='" + RecTime + '\'' +
                ", RecNum='" + RecNum + '\'' +
                ", RecCal=" + RecCal +
                ", RecTag='" + RecTag + '\'' +
                ", UserId=" + UserId +
                ", RecLiked=" + RecLiked +
                ", RecCreated='" + RecCreated + '\'' +
                ", RecViews=" + RecViews +
                ", RecStatus=" + RecStatus +
                ", recipeMaterialBeans=" + recipeMaterialBeans +
                ", recipeStepBeans=" + recipeStepBeans +
                '}';
    }

    public Integer getRecStatus() {
        return RecStatus;
    }

    public void setRecStatus(Integer recStatus) {
        RecStatus = recStatus;
    }
    //     配置 多對一 (Category表)
//    @JsonIgnore
//    @ManyToOne
//    @JoinColumn(name = "CategoryId", referencedColumnName = "CategoryId",insertable = false, updatable = false)
//    private RecipeCategoryBean recipeCategoryBean;

    // 配置 一對多 (Material表, Step表)
    @JsonIgnore
    @OneToMany(mappedBy = "recipeMainBean", cascade = CascadeType.ALL)
    private List<RecipeMaterialBean> recipeMaterialBeans ;

    @JsonIgnore
    @OneToMany(mappedBy = "recipeMainBean", cascade = CascadeType.ALL)
    private List<RecipeStepBean> recipeStepBeans ;

//    public RecipeCategoryBean getRecipeCategoryBean() {
//        return recipeCategoryBean;
//    }
//
//    public void setRecipeCategoryBean(RecipeCategoryBean recipeCategoryBean) {
//        this.recipeCategoryBean = recipeCategoryBean;
//    }

    public List<RecipeMaterialBean> getRecipeMaterialBeans() {
        return recipeMaterialBeans;
    }

    public void setRecipeMaterialBeans(List<RecipeMaterialBean> recipeMaterialBeans) {
        this.recipeMaterialBeans = recipeMaterialBeans;
    }

    public List<RecipeStepBean> getRecipeStepBeans() {
        return recipeStepBeans;
    }

    public void setRecipeStepBeans(List<RecipeStepBean> recipeStepBeans) {
        this.recipeStepBeans = recipeStepBeans;
    }
}
