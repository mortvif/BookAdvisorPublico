package es.upm.dit.isst.bookadvisor.dao.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Exchange implements Serializable {
	// Id must be unique. For instance requester.getUsername()+(new Date())
	@Id
	private String id;
	// Description of the exchange. e.g books requested by the user
	@Column(columnDefinition = "TEXT")
	private String description;
	private Date createdAt;

	@ManyToOne
	private Book bookRequested;
	
	@ManyToOne
	private User requester;
	
	@ManyToOne
	private User accepter;
	
	public Exchange() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Book getBookRequested() {
		return bookRequested;
	}

	public void setBookRequested(Book bookRequested) {
		this.bookRequested = bookRequested;
	}

	public User getRequester() {
		return requester;
	}

	public void setRequester(User requester) {
		this.requester = requester;
	}

	public User getAccepter() {
		return accepter;
	}

	public void setAccepter(User accepter) {
		this.accepter = accepter;
	}
	
}
