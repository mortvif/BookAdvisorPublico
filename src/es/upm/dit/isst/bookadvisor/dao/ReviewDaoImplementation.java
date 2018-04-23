package es.upm.dit.isst.bookadvisor.dao;

import org.hibernate.Session;

import es.upm.dit.isst.bookadvisor.dao.model.Review;
import es.upm.dit.isst.bookadvisor.dao.SessionFactoryService;

public class ReviewDaoImplementation implements ReviewDao {
	
	private static ReviewDaoImplementation instance = null;
	private ReviewDaoImplementation() {
		// TODO Auto-generated constructor stub
	}
	public static ReviewDaoImplementation getInstance() {
		if(null == instance) {
			instance = new ReviewDaoImplementation();
		}
		
		return instance;
	}
	

	@Override
	public Review getReview(String id) {
		Session session = SessionFactoryService.get().openSession();
		Review review = null;
		try {
			session.beginTransaction();
			review = (Review) session.createQuery("select r from Review r where r.id= :id")
					.setParameter("id", id)
					.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
		
		return review;
	}

	@Override
	public void createReview(Review review) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.save(review);
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
		
	}

	@Override
	public void updateReview(Review review) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(review);
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
		
	}

	@Override
	public void deleteReview(Review review) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.delete(review);
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
		
	}

}
