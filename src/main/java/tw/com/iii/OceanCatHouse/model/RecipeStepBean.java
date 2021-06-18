package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;

import javax.persistence.*;

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
                ", recipeMainBean=" + recipeMainBean.getRecId() +
                '}';
    }

    public Integer getStepId() {
        return StepId;
    }

    public void setStepId(Integer stepId) {
        StepId = stepId;
    }

    public Integer getRecId() {
        return RecId;
    }

    public void setRecId(Integer recId) {
        RecId = recId;
    }

    public String getStep() {
        return Step;
    }

    public void setStep(String step) {
        Step = step;
    }

    public String getStepPic() {
        return StepPic;
    }

    public void setStepPic(String stepPic) {
        StepPic = stepPic;
    }

    public String getStepText() {
        return StepText;
    }

    public void setStepText(String stepText) {
        StepText = stepText;
    }

    public RecipeMainBean getRecipeMainBean() {
        return recipeMainBean;
    }

    public void setRecipeMainBean(RecipeMainBean recipeMainBean) {
        this.recipeMainBean = recipeMainBean;
    }

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "RecId", referencedColumnName = "RecId",insertable = false, updatable = false)
    private RecipeMainBean recipeMainBean;

}
