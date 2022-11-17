package DiamonShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DiamonShop.Dao.CategoryDao;
import DiamonShop.Dao.MenuDao;
import DiamonShop.Dao.ProductsDao;
import DiamonShop.Dao.SlidesDao;
import DiamonShop.Dto.ProductsDto;
import DiamonShop.Entity.Category;
import DiamonShop.Entity.Menus;
import DiamonShop.Entity.Slides;

@Service
public class HomeServiceImpl implements IHomeService {
	@Autowired
	private SlidesDao slidesDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private MenuDao menuDao;
	
	@Autowired
	private ProductsDao productsDao;
	
	public List<Slides> getDataSlides() {
		return slidesDao.getDataSlides();
	}

	public List<Category> getDataCategory() {
		return categoryDao.getDataCategory();
	}

	public List<Menus> getDataMenus() {
		return menuDao.getDataMenus();
	}

	public List<ProductsDto> getDataNewProductsDto() {
		List<ProductsDto> listProducts = productsDao.getDataNewProductsDto();
		return listProducts;
	}
	
	public List<ProductsDto> getDataHightLightProductsDto() {
		List<ProductsDto> listProducts = productsDao.getDataHightLightProductsDto();
		return listProducts;
	}
	
}
