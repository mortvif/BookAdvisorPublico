package es.upm.dit.isst.bookadvisor.dao;

import java.util.List;

import es.upm.dit.isst.bookadvisor.dao.model.User;
import es.upm.dit.isst.bookadvisor.dao.model.UserType;

public interface UserDAO {
	
	public User loginUser(String username, String password);
	public User getUser(String username);
	public List<User> getUserByType(UserType type);
	public void updateUser(User user);
	public void deleteUser(User user);
	void createUser(User user);

}
