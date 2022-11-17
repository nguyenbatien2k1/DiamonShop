package DiamonShop.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperProductsDto implements RowMapper<ProductsDto> {

	public ProductsDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		ProductsDto productsDto = new ProductsDto();

		productsDto.setProduct_id(rs.getLong("product_id"));
		productsDto.setCategory_id(rs.getInt("category_id"));
		productsDto.setSizes(rs.getString("sizes"));
		productsDto.setName(rs.getString("name"));
		productsDto.setPrice(rs.getDouble("price"));
		productsDto.setSale(rs.getInt("sale"));
		productsDto.setTitle(rs.getString("title"));
		productsDto.setHightlight(rs.getBoolean("hightlight"));
		productsDto.setNew_product(rs.getBoolean("new_product"));
		productsDto.setDetails(rs.getString("details"));
		productsDto.setCreated_at(rs.getDate("created_at"));
		productsDto.setUpdated_at(rs.getDate("updated_at"));
		productsDto.setColor_id(rs.getInt("color_id"));
		productsDto.setColor_name(rs.getString("color_name"));
		productsDto.setCode(rs.getString("code"));
		productsDto.setImg(rs.getString("img"));

		return productsDto;
	}

}
