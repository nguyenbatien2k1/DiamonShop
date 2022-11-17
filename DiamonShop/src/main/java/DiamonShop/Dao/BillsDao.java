package DiamonShop.Dao;

import org.springframework.stereotype.Repository;

import DiamonShop.Entity.BillDetails;
import DiamonShop.Entity.Bills;

@Repository
public class BillsDao extends BaseDao {
	
	public int addBills(Bills bill) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO bills ");
		sql.append("( ");
		sql.append("	user, phone, display_name, address, total, quantity, note ");
		sql.append(") ");
		sql.append("VALUES ");
		sql.append("( ");
		sql.append("	'" + bill.getUser() + "', ");
		sql.append("	'" + bill.getPhone() + "', ");
		sql.append("	'" + bill.getDisplay_name() + "', ");
		sql.append("	'" + bill.getAddress() + "', ");
		sql.append("	'" + bill.getTotal() + "', ");
		sql.append("	'" + bill.getQuantity() + "', ");
		sql.append("	'" + bill.getNote() + "' ");
		sql.append(");");
		
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
	
	public long getIdLastBills() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT MAX(id) FROM bills");
		long id = _jdbcTemplate.queryForObject(sql.toString(), new Object[] {}, Long.class);
		return id;
	}
	
	public int addBillsDetails(BillDetails billDetails) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO billdetails ");
		sql.append("( ");
		sql.append("	product_id, ");
		sql.append("	bill_id, ");
		sql.append("	quantity, ");
		sql.append("	total ");
		sql.append(") ");
		sql.append("VALUES ");
		sql.append("( ");
		sql.append("	" + billDetails.getProduct_id() + ", ");
		sql.append("	" + billDetails.getBill_id() + ", ");
		sql.append("	" + billDetails.getQuantity() + ", ");
		sql.append("	" + billDetails.getTotal() + " ");
		sql.append(")");
		
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
	
}
