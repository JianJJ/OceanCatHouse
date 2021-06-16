package tw.com.iii.OceanCatHouse.model;

import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

//@Data
@Entity
@Table(name = "recipe_category")
public class RecipeCategoryBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer CategoryId;
    private String CategoryName;

    @Override
    public String toString() {
        return "RecipeCategoryBean{" +
                "CategoryId=" + CategoryId +
                ", CategoryName='" + CategoryName + '\'' +
                '}';
    }

    @OneToMany(mappedBy = "recipeCategoryBean", cascade=CascadeType.ALL)
    private Set<RecipeMainBean> recipeMainBeans = new HashSet<>();

    public Integer getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(Integer categoryId) {
        CategoryId = categoryId;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String categoryName) {
        CategoryName = categoryName;
    }

    public Set<RecipeMainBean> getRecipeMainBeans() {
        return recipeMainBeans;
    }

    public void setRecipeMainBeans(Set<RecipeMainBean> recipeMainBeans) {
        this.recipeMainBeans = recipeMainBeans;
    }
}
