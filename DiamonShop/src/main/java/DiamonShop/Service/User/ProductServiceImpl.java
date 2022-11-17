package DiamonShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DiamonShop.Dao.ProductsDao;
import DiamonShop.Dto.ProductsDto;

@Service
public class ProductServiceImpl implements IProductService {
	
	@Autowired
	private ProductsDao productDao = new ProductsDao();
	
	public ProductsDto getProductById(long id) {
		List<ProductsDto> listProducts = productDao.getProductById(id);
		return listProducts.get(0);
	}

	public List<ProductsDto> getProductsByCategoryId(int id) {
		return productDao.getAllProductsById(id);
	}
	
}
