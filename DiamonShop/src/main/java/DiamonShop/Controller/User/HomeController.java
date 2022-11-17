package DiamonShop.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController extends BaseController {
	
	@RequestMapping(value = {"/", "/trang-chu"})
	public ModelAndView Index() {
		_mvShare.addObject("slides", _homeService.getDataSlides());
		_mvShare.addObject("category", _homeService.getDataCategory());
		_mvShare.addObject("newProducts", _homeService.getDataNewProductsDto());
		_mvShare.addObject("hightlightProducts", _homeService.getDataHightLightProductsDto());
		_mvShare.setViewName("user/index");
		return _mvShare;
	}
	
	@RequestMapping(value = "/products")
	public ModelAndView Products() {
		ModelAndView mv = new ModelAndView("user/products");
		return mv;
	}
}
