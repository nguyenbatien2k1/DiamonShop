package DiamonShop.Controller.User;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import DiamonShop.Dto.CartDto;
import DiamonShop.Entity.Bills;
import DiamonShop.Entity.Users;
import DiamonShop.Service.User.BillsServiceImpl;
import DiamonShop.Service.User.CartServiceImpl;

@Controller
public class CartController extends BaseController {
	
	@Autowired
	private CartServiceImpl cartService = new CartServiceImpl();
	
	@Autowired
	private BillsServiceImpl billService = new BillsServiceImpl();
	
	@RequestMapping(value = {"gio-hang"})
	public ModelAndView Index() {
		_mvShare.addObject("slides", _homeService.getDataSlides());
		_mvShare.addObject("category", _homeService.getDataCategory());
		_mvShare.addObject("newProducts", _homeService.getDataNewProductsDto());
		_mvShare.addObject("hightlightProducts", _homeService.getDataHightLightProductsDto());
		_mvShare.setViewName("user/cart/list_cart");
		return _mvShare;
	}
	
	@RequestMapping(value = "AddCart/{id}")
	public String AddCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>)session.getAttribute("Cart");
		if(cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.addCart(id, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("totalQuantityCart", cartService.totalQuantity(cart));
		session.setAttribute("totalPriceCart", cartService.totalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = "EditCart/{id}/{quantity}")
	public String EditCart(HttpServletRequest request, HttpSession session, @PathVariable long id, @PathVariable int quantity) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>)session.getAttribute("Cart");
		if(cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.editCart(id, quantity, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("totalQuantityCart", cartService.totalQuantity(cart));
		session.setAttribute("totalPriceCart", cartService.totalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = "DeleteCart/{id}")
	public String DeleteCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>)session.getAttribute("Cart");
		if(cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.deleteCart(id, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("totalQuantityCart", cartService.totalQuantity(cart));
		session.setAttribute("totalPriceCart", cartService.totalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = "thanh-toan", method = RequestMethod.GET)
	public ModelAndView checkOut(HttpServletRequest request, HttpSession session) {
		_mvShare.setViewName("user/bills/checkout");
		Bills bills = new Bills();
		Users LoginInfo = (Users)session.getAttribute("loginInfo");
		if(LoginInfo != null) {
			bills.setAddress(LoginInfo.getAddress());
			bills.setDisplay_name(LoginInfo.getDisplay_name());
			bills.setUser(LoginInfo.getUser());
		}
		_mvShare.addObject("bills", bills);
		return _mvShare;
	}
	
	@RequestMapping(value = "thanh-toan", method = RequestMethod.POST)
	public String checkOutBill(HttpServletRequest request, HttpSession session, @ModelAttribute("bills") Bills bill) {
		
		bill.setQuantity(Integer.parseInt(session.getAttribute("totalQuantityCart").toString()));
		bill.setTotal(Double.parseDouble(session.getAttribute("totalPriceCart").toString()));
		
		if(billService.addBills(bill) > 0) {
			HashMap<Long, CartDto> carts = (HashMap<Long, CartDto>)session.getAttribute("Cart");
			billService.addBillsDetails(carts);
		}
		session.removeAttribute("Cart");
		session.removeAttribute("totalQuantityCart");
		session.removeAttribute("totalPriceCart");
		return "redirect:gio-hang";
	}
}
