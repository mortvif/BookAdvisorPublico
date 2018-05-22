package es.upm.dit.isst.bookadvisor.dao;

import java.util.List;

import es.upm.dit.isst.bookadvisor.dao.model.Review;
import es.upm.dit.isst.bookadvisor.dao.model.User;

public interface ReviewDao {
	
	public Review getReview(String id);
	public List<Review> getUserReviews(User u);
	public void createReview(Review review);
	public void updateReview(Review review);
	public void deleteReview(Review review);
	
}
