package tw.com.iii.OceanCatHouse.model;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

// @NoArgsConstructor  無參建構
// @AllArgsConstructor 有參建構
@ToString
@Data
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
    private Integer RecTime;
    private Integer RecNum;
    private Integer RecCal;
    private String RecTag;
    private Integer UserId;
    private Integer RecLiked;
    private String RecCreated;
    private Integer RecViews;

    // 配置多對一 (Category表)
//    @ManyToOne(targetEntity = RecipeCategoryBean.class)
//    @JoinColumn(name = "CategoryId", referencedColumnName = "CategoryId",insertable = false, updatable = false)  // 外鍵關係設置
//    private RecipeCategoryBean recipeCategoryBean;

//    // 配置一對多 (Material表, Step表)
//    @OneToMany(targetEntity = RecipeMaterialBean.class, cascade = CascadeType.ALL) // 放棄外鍵維護權, 開啟級聯操作
//    @JoinColumn(name = "RecId", referencedColumnName = "RecId")
//    private Set<RecipeMaterialBean> recipeMaterialBeans = new HashSet<>();
//
//    @OneToMany(targetEntity = RecipeStepBean.class, cascade = CascadeType.ALL) // 放棄外鍵維護權, 開啟級聯操作
//    @JoinColumn(name = "RecId", referencedColumnName = "RecId")
//    private Set<RecipeStepBean> recipeStepBeans = new HashSet<>();
//

}
