package es.upm.dit.isst.bookadvisor.dao;

import es.upm.dit.isst.bookadvisor.dao.model.Review;

public interface ReviewDao {
	
	public Review getReview(String id);
	public void createReview(Review review);
	public void updateReview(Review review);
	public void deleteReview(Review review);
	
}
