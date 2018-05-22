package es.upm.dit.isst.bookadvisor.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.upm.dit.isst.bookadvisor.dao.model.User;
import es.upm.dit.isst.bookadvisor.dao.model.UserType;
import es.upm.dit.isst.bookadvisor.dao.SessionFactoryService;

public class UserDaoImplementation implements UserDAO {

	private static UserDaoImplementation instance = null;
	private UserDaoImplementation() {};
	public static UserDaoImplementation getInstance() {
		if(null == instance) {
			instance = new UserDaoImplementation();
		}
		
		return instance;
	}
	
	@Override
	public User loginUser(String username, String password) {
		Session session = SessionFactoryService.get().openSession();
		User user = null;
		try {
			session.beginTransaction();
			user = (User) session.createQuery("select u from User u where u.username= :username and u.password = :password")
					.setParameter("username", username)
					.setParameter("password", password)
					.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
		
		return user;
	}

	@Override
	public User getUser(String username) {
		Session session = SessionFactoryService.get().openSession();
		User user = null;
		try {
			session.beginTransaction();
			user = (User) session.createQuery("select u from User u where u.username= :username")
					.setParameter("username", username)
					.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
		
		return user;
	}

	@Override
	public void createUser(User user) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.save(user);
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
	}

	@Override
	public void updateUser(User user) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(user);
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteUser(User user) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.delete(user);
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUserByType(UserType type) {
		List<User> users = new ArrayList<>();
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			users.addAll(session.createQuery("select u from User u where u.role = :type").setParameter("type", type).list());
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
		return users;
	}

}
