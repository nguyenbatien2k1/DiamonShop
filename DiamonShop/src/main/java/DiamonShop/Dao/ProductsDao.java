package DiamonShop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import DiamonShop.Dto.MapperProductsDto;
import DiamonShop.Dto.ProductsDto;

@Repository
public class ProductsDao extends BaseDao {
	
	private final boolean YES = true;
	private final boolean NO = false;
	
	public StringBuffer sqlString() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT p.id as product_id, ");
		sql.append("p.category_id, ");
		sql.append("p.sizes, ");
		sql.append("p.name, ");
		sql.append("p.price, ");
		sql.append("p.sale, ");
		sql.append("p.title, ");
		sql.append("p.hightlight, ");
		sql.append("p.new_product, ");
		sql.append("p.details, ");
		sql.append("c.id as color_id, ");
		sql.append("c.name as color_name, ");
		sql.append("c.code, ");
		sql.append("c.img, ");
		sql.append("p.created_at, ");
		sql.append("p.updated_at ");
		sql.append("from products as p ");
		sql.append("inner join colors as c ");
		sql.append("on p.id = c.product_id ");
		
		return sql;
	}
	
	public String sqlProducts(boolean newProducts, boolean hightLightProducts) {
		StringBuffer sql = sqlString();
		
		sql.append("where 1 = 1 ");
		
		if(newProducts) {
			sql.append("and new_product = true ");
		}
		
		if(hightLightProducts) {
			sql.append("and hightlight = true ");
		}
		sql.append("group by p.id, c.product_id ");
		sql.append("order by RAND() ");
		
		if(newProducts) {
			sql.append("LIMIT 12 ");
		}
		
		if(hightLightProducts) {
			sql.append("LIMIT 9 ");
		}
		
		return sql.toString();
		
	}
	
	public StringBuffer sqlProductsById(int id) {
		StringBuffer sql = sqlString();
		sql.append("WHERE 1 = 1 ");
		sql.append("AND category_id = " + id + " ");
		return sql;
	}
	
	public String sqlProductsPaginates(int id, int start, int totalPage) {
		StringBuffer sql = sqlProductsById(id);
		sql.append("LIMIT " + start + ", " + totalPage);
		return sql.toString();
	}
	
	public List<ProductsDto> getDataHightLightProductsDto() {
		String sql = sqlProducts(NO, YES);
		List<ProductsDto> listProducts = _jdbcTemplate.query(sql, new MapperProductsDto());
		return listProducts;
	}
	
	public List<ProductsDto> getDataNewProductsDto() {
		String sql = sqlProducts(YES, NO);
		List<ProductsDto> listProducts = _jdbcTemplate.query(sql, new MapperProductsDto());
		return listProducts;
	}
	
	public List<ProductsDto> getAllProductsById(int id) {
		String sql = sqlProductsById(id).toString();
		List<ProductsDto> listProducts = _jdbcTemplate.query(sql, new MapperProductsDto());
		return listProducts;
	}
	
	public List<ProductsDto> getDataProductsPaginates(int id, int start, int totalPage) {
		StringBuffer sqlGetDataById = sqlProductsById(id);
		List<ProductsDto> listProductsById = _jdbcTemplate.query(sqlGetDataById.toString(), new MapperProductsDto());
		List<ProductsDto> listProducts = new ArrayList<ProductsDto>();
		if(listProductsById.size() > 0) {
			String sql = sqlProductsPaginates(id, start, totalPage);
			listProducts = _jdbcTemplate.query(sql, new MapperProductsDto());
		}
		return listProducts;
	}
	
	private String sqlProductById(long id) {
		StringBuffer sql = sqlString();
		sql.append("WHERE 1 = 1 ");
		sql.append("AND p.id = " + id + " ");
		sql.append("LIMIT 1 ");
		return sql.toString();
	}

	public List<ProductsDto> getProductById(long id) {
		String sql = sqlProductById(id);
		List<ProductsDto> listProducts = _jdbcTemplate.query(sql, new MapperProductsDto());
		return listProducts;
	}
	
	public ProductsDto findProductById(long id) {
		String sql = sqlProductById(id);
		ProductsDto product = _jdbcTemplate.queryForObject(sql, new MapperProductsDto());
		return product;
	}
}
