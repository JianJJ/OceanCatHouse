package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;

import javax.persistence.*;

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

        // 配置多對一

    @Override
    public String toString() {
        return "RecipeStepBean{" +
                "StepId=" + StepId +
                ", RecId=" + RecId +
                ", Step='" + Step + '\'' +
                ", StepPic='" + StepPic + '\'' +
                ", StepText='" + StepText + '\'' +
                ", recipeMainBean=" + recipeMainBean +
                '}';
    }

    @ManyToOne(cascade={CascadeType.MERGE})
    @JoinColumn(name = "RecId", referencedColumnName = "RecId",insertable = false, updatable = false)
    private RecipeMainBean recipeMainBean;

}
