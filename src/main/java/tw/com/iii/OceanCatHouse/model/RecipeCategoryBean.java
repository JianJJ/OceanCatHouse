package tw.com.iii.OceanCatHouse.model;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
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
}
