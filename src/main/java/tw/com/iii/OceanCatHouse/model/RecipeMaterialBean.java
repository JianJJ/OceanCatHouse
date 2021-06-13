package tw.com.iii.OceanCatHouse.model;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@ToString
@Data
@Entity
@Table(name = "`recipe_material`")
public class RecipeMaterialBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer MaterialId;
    private Integer RecId;
    private String Gp;
    private String MaterialName;
    private String UnitNum;

    @ManyToOne(targetEntity = RecipeBean.class)
    @JoinColumn(name = "RecId", referencedColumnName = "RecId",insertable = false, updatable = false)  // 外鍵關係設置
    private RecipeBean recipeBean;
}
