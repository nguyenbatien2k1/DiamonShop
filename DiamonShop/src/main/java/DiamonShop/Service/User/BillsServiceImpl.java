package DiamonShop.Service.User;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DiamonShop.Dao.BillsDao;
import DiamonShop.Dto.CartDto;
import DiamonShop.Entity.BillDetails;
import DiamonShop.Entity.Bills;

@Service
public class BillsServiceImpl implements IBillsService {

	@Autowired
	private BillsDao billsDao;
	
	public int addBills(Bills bill) {
		return billsDao.addBills(bill);
	}

	public void addBillsDetails(HashMap<Long, CartDto> carts) {
		
		long idBills = billsDao.getIdLastBills();
		
		for(Map.Entry<Long, CartDto> itemCart : carts.entrySet()) {
			BillDetails billDetails = new BillDetails();
			billDetails.setBill_id(idBills);
			billDetails.setProduct_id(itemCart.getValue().getProduct().getProduct_id());
			billDetails.setQuantity(itemCart.getValue().getQuantity());
			billDetails.setTotal(itemCart.getValue().getTotalPrice());
			
			billsDao.addBillsDetails(billDetails);
		}
	}
	
}
