package es.upm.dit.isst.bookadvisor.dao.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class Book implements Serializable{
	@Id
	private String isbn;
	private String title;
	private String author;
	private String publisher;
	@Column(columnDefinition = "TEXT")
	private String synopsis;
	private Date publishDate;
	private BookFormat format;
	private BookGenre genre;
	
	// Publishers can create new Books. These books are to be set as newBook = True
	private Boolean newBook;
	
	// Cover image is to be saved in file system. Path to image is saved in database
	private String coverPath;
	
	// Created by
	@ManyToOne
	private User createdBy;
	
	// Reviews
	private int rating;
	private int nRated;
	
	@OneToMany(mappedBy = "bookReviewed", fetch = FetchType.EAGER)
	private List<Review> reviews;
	
	@OneToMany(mappedBy = "bookRequested", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Exchange> exchanges;
	
	public Book() {
		this.reviews = new ArrayList<>();
		this.exchanges = new ArrayList<>();
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getSynopsis() {
		return synopsis;
	}

	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public BookFormat getFormat() {
		return format;
	}

	public void setFormat(BookFormat format) {
		this.format = format;
	}

	public BookGenre getGenre() {
		return genre;
	}

	public void setGenre(BookGenre genre) {
		this.genre = genre;
	}


	public User getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getnRated() {
		return nRated;
	}

	public void setnRated(int nRated) {
		this.nRated = nRated;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public Boolean getNewBook() {
		return newBook;
	}

	public void setNewBook(Boolean newBook) {
		this.newBook = newBook;
	}

	public String getCoverPath() {
		return coverPath;
	}

	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}
	
	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	
	public void addReview(Review r) {
		this.reviews.add(r);
	}
	
	public void addRating(int r) {
		this.rating=(this.rating*this.nRated+r)/(this.nRated+1);
		this.nRated += 1;

	}

	public List<Exchange> getExchanges() {
		return exchanges;
	}

	public void setExchanges(List<Exchange> exchanges) {
		this.exchanges = exchanges;
	}
	
}
