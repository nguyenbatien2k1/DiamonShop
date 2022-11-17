package DiamonShop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import DiamonShop.Entity.Category;
import DiamonShop.Entity.MapperCategory;

@Repository
public class CategoryDao extends BaseDao {
	
	public List<Category> getDataCategory() {
		List<Category> list = new ArrayList<Category>();
		String sql = "SELECT * FROM category";
		list = _jdbcTemplate.query(sql, new MapperCategory());
		return list;
	}
}
