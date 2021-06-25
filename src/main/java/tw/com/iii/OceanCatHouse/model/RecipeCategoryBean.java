package tw.com.iii.OceanCatHouse.model;

import javax.persistence.*;

@Entity
@Table(name = "recipe_category")
public class RecipeCategoryBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer CategoryId;
    private String CategoryName;

    public Integer getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(Integer categoryId) {
        CategoryId = categoryId;
    }

    @Override
    public String toString() {
        return "RecipeCategoryBean{" +
                "CategoryId=" + CategoryId +
                ", CategoryName='" + CategoryName + '\'' +
//                ", recipeMainBeans=" + recipeMainBeans.size() +
                '}';
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String categoryName) {
        CategoryName = categoryName;
    }

//    public Set<RecipeMainBean> getRecipeMainBeans() {
//        return recipeMainBeans;
//    }
//
//    public void setRecipeMainBeans(Set<RecipeMainBean> recipeMainBeans) {
//        this.recipeMainBeans = recipeMainBeans;
//    }
//
//    @JsonIgnore
//    @OneToMany(mappedBy = "recipeCategoryBean", cascade=CascadeType.ALL)
//    private Set<RecipeMainBean> recipeMainBeans = new HashSet<>();
}
