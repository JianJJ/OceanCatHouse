package tw.com.iii.OceanCatHouse.model;

import javax.persistence.*;

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

    public Integer getMaterialId() {
        return MaterialId;
    }

    public void setMaterialId(Integer materialId) {
        MaterialId = materialId;
    }

    public Integer getRecId() {
        return RecId;
    }

    public void setRecId(Integer recId) {
        RecId = recId;
    }

    public String getGp() {
        return Gp;
    }

    public void setGp(String gp) {
        Gp = gp;
    }

    public String getMaterialName() {
        return MaterialName;
    }

    public void setMaterialName(String materialName) {
        MaterialName = materialName;
    }

    public String getUnitNum() {
        return UnitNum;
    }

    public void setUnitNum(String unitNum) {
        UnitNum = unitNum;
    }

    public RecipeMainBean getRecipeMainBean() {
        return recipeMainBean;
    }

    public void setRecipeMainBean(RecipeMainBean recipeMainBean) {
        this.recipeMainBean = recipeMainBean;
    }

    @ManyToOne(cascade={CascadeType.MERGE})
    @JoinColumn(name = "RecId", referencedColumnName = "RecId",insertable = false, updatable = false)  // 外鍵關係設置
    private RecipeMainBean recipeMainBean;
}
