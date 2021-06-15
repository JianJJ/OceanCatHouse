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

    @Override
    public String toString() {
        return "RecipeMaterialBean{" +
                "MaterialId=" + MaterialId +
                ", RecId=" + RecId +
                ", Gp='" + Gp + '\'' +
                ", MaterialName='" + MaterialName + '\'' +
                ", UnitNum='" + UnitNum + '\'' +
                ", recipeMainBean=" + recipeMainBean +
                '}';
    }

    @ManyToOne(targetEntity = RecipeMainBean.class)
    @JoinColumn(name = "RecId", referencedColumnName = "RecId",insertable = false, updatable = false)  // 外鍵關係設置
    private RecipeMainBean recipeMainBean;
}
