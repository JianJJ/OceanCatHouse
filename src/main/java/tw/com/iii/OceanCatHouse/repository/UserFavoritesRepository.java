package tw.com.iii.OceanCatHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tw.com.iii.OceanCatHouse.model.UserFavoritesBean;

public interface UserFavoritesRepository extends JpaRepository<UserFavoritesBean, Integer> {
}
