package DiamonShop.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DiamonShop.Service.User.ProductServiceImpl;

@Controller
public class ProductController extends BaseController {
	
	@Autowired
	public ProductServiceImpl productService;
	
	@RequestMapping(value = "/chi-tiet-san-pham/{id}")
	
	public ModelAndView Product(@PathVariable long id) {
		_mvShare.setViewName("user/products/product");
		_mvShare.addObject("product", productService.getProductById(id));
		
		int categoryId = productService.getProductById(id).getCategory_id();
		_mvShare.addObject("productByCategoryId", productService.getProductsByCategoryId(categoryId));
		
		return _mvShare;
	}
}
