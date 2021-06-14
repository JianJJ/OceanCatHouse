package tw.com.iii.OceanCatHouse.model;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@ToString
@Data
@Entity
@Table(name = "`recipe_step`")
public class RecipeStepBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer StepId;
    private Integer RecId;
    private String Step;
    private String StepPic;
    private String StepText;

//    // 配置多對一
//    @ManyToOne(targetEntity = RecipeMainBean.class)
//    @JoinColumn(name = "RecId", referencedColumnName = "RecId",insertable = false, updatable = false)
//    private RecipeMainBean recipeMainBean;

}
