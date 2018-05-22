package es.upm.dit.isst.bookadvisor.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.upm.dit.isst.bookadvisor.dao.model.Book;
import es.upm.dit.isst.bookadvisor.dao.model.Exchange;
import es.upm.dit.isst.bookadvisor.dao.model.User;

public class ExchangeDaoImplementation implements ExchangeDao {

	
	private static ExchangeDaoImplementation instance = null;
	private ExchangeDaoImplementation() {};
	public static ExchangeDaoImplementation getInstance() {
		if( null == instance) {
			instance = new ExchangeDaoImplementation();
		}
		
		return instance;
	}
	
	@Override
	public Exchange getExchange(String id) {
		Session session = SessionFactoryService.get().openSession();
		Exchange exchange = null;
		try {
			session.beginTransaction();
			exchange = (Exchange) session.createQuery("select e from Exchange e where e.id= :id")
					.setParameter("id", id)
					.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
		
		return exchange;
	}

	@Override
	public List<Exchange> getUserExchanges(User u) {
		List<Exchange> exchanges = new ArrayList<>();
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			exchanges.addAll(session.createQuery("select e from Exchange e where e.requester = :user or e.accepter = :user").setParameter("user", u).list());
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
		return exchanges;
	}
	
	@Override
	public List<User> getBookRequesters(Book book) {
		List<User> requesters = new ArrayList<>();
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			requesters.addAll(session.createQuery("select requester from Exchange e where e.bookRequested = :book").setParameter("book", book).list());
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
		return requesters;
	}

	@Override
	public void createExchange(Exchange exchange) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.save(exchange);
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
	}

	@Override
	public void updateExchange(Exchange exchange) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(exchange);
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteExchange(Exchange exchange) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.delete(exchange);
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
	}

}
