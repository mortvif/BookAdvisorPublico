package es.upm.dit.isst.bookadvisor.dao.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Review implements Serializable {
	
	@Id
	private String id;
	private String review;
	private Date createdAt;
	
	@ManyToOne
	private User author;
	
	@ManyToOne
	private Book bookReviewed;
	
	public Review() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public Book getBookReviewed() {
		return bookReviewed;
	}

	public void setBookReviewed(Book bookReviewed) {
		this.bookReviewed = bookReviewed;
	};
	
	
	
}
