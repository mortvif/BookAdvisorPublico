package es.upm.dit.isst.bookadvisor.test;

import java.util.List;

import es.upm.dit.isst.bookadvisor.dao.UserDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.User;
import es.upm.dit.isst.bookadvisor.dao.model.UserType;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		User u = new User();
//		u.setUsername("asdasdas");
//		u.setPassword("asdsadasd");
//		u.setRole(UserType.READER);
		
//		UserDaoImplementation.getInstance().createUser(u);
		
		User b = UserDaoImplementation.getInstance().getUser("asdasdas");
		System.out.println(b.getUsername());
		System.out.println(b.getCookie());

//		User us = new User();
//		us.setUsername("asd");
//		us.setPassword("66666");
//		us.setRole(UserType.READER);
		
//		UserDaoImplementation.getIns	tance().createUser(us);
		
		System.out.println("BUCLEEE");
		List<User> users = UserDaoImplementation.getInstance().getUserByType(UserType.READER);
		System.out.println(users);
		for(User user: users) {
			System.out.println(user.getRole());
		}
		

	}

}
