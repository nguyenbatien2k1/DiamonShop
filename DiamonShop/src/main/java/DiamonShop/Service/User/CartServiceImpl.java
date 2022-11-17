package DiamonShop.Service.User;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DiamonShop.Dao.CartDao;
import DiamonShop.Dto.CartDto;

@Service 
public class CartServiceImpl implements ICartService {
	
	@Autowired
	private CartDao cartDao = new CartDao();
	
	public HashMap<Long, CartDto> addCart(long id, HashMap<Long, CartDto> cart) {
		return cartDao.addCart(id, cart);
	}

	public HashMap<Long, CartDto> editCart(long id, int quantity, HashMap<Long, CartDto> cart) {
		return cartDao.editCart(id, quantity, cart);
	}

	public HashMap<Long, CartDto> deleteCart(long id, HashMap<Long, CartDto> cart) {
		return cartDao.deleteCart(id, cart);
	}

	public int totalQuantity(HashMap<Long, CartDto> cart) {
		return cartDao.totalQuantity(cart);
	}

	public double totalPrice(HashMap<Long, CartDto> cart) {
		return cartDao.totalPrice(cart);
	}
	
}
