package DiamonShop.Dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DiamonShop.Dto.CartDto;
import DiamonShop.Dto.ProductsDto;

@Repository
public class CartDao extends BaseDao {
	
	@Autowired
	ProductsDao productsDao = new ProductsDao();
	
	public HashMap<Long, CartDto> addCart(long id, HashMap<Long, CartDto> cart) {
		CartDto itemCart = new CartDto();
		ProductsDto product = productsDao.findProductById(id);
		if(product != null && cart.containsKey(id)) {	
			itemCart = cart.get(id);
			itemCart.setQuantity(itemCart.getQuantity() + 1);
			double total = itemCart.getQuantity() * itemCart.getProduct().getPrice();
			itemCart.setTotalPrice(total);
		}
		else {
			itemCart.setProduct(product);
			itemCart.setQuantity(1);
			double total = product.getPrice();
			itemCart.setTotalPrice(total);
		}
		cart.put(id, itemCart);
		return cart;
	}
	
	public HashMap<Long, CartDto> editCart(long id, int quantity, HashMap<Long, CartDto> cart) {
		if(cart == null) {
			return cart;
		}
		CartDto itemCart = new CartDto();
		if(cart.containsKey(id)) {
			itemCart = cart.get(id);
			itemCart.setQuantity(quantity);
			itemCart.setTotalPrice(quantity * itemCart.getProduct().getPrice());
		}
		cart.put(id, itemCart);
		return cart;
	}
	
	public HashMap<Long, CartDto> deleteCart(long id, HashMap<Long, CartDto> cart) {
		if(cart == null) {
			return cart;
		}
		if(cart.containsKey(id)) {
			cart.remove(id);
		}
		return cart;
	}
	
	public int totalQuantity(HashMap<Long, CartDto> cart) {
		int totalQuantity = 0;
		for(Map.Entry<Long, CartDto> item : cart.entrySet()) {
			totalQuantity += item.getValue().getQuantity();
		}
		return totalQuantity;
	}
	
	public double totalPrice(HashMap<Long, CartDto> cart) {
		double totalPrice = 0;
		for(Map.Entry<Long, CartDto> item : cart.entrySet()) {
			totalPrice += item.getValue().getTotalPrice();
		}
		return totalPrice;
	}
}
