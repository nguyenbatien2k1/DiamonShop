package DiamonShop.Service.User;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DiamonShop.Dao.UsersDao;
import DiamonShop.Entity.Users;

@Service
public class AccountServiceImpl implements IAccountService{
	
	@Autowired
	UsersDao usersDao = new UsersDao(); 
	
	public int addAccount(Users user) {
		
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		
		return usersDao.addAccount(user);
	}

	public Users checkAccount(Users user) {
		String pw = user.getPassword();
		
		user = usersDao.getUserByAccount(user);
		if(user != null) {
			if(BCrypt.checkpw(pw, user.getPassword())) {
				return user;
			}
			else {
				return null;
			}
		}
		return null;
	}
}
