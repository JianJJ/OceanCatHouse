package tw.com.iii.OceanCatHouse.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@ToString
@Data
@Entity
@Table(name = "recipe_category")
public class RecipeCategoryBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer CategoryId;
    private String CategoryName;

//    @JsonIgnore
//    @OneToMany(mappedBy = "recipeCategoryBean", cascade=CascadeType.ALL)
//    private Set<RecipeBean> recipeBeans = new HashSet<>();
}
