package es.upm.dit.isst.bookadvisor.dao;

import java.util.List;

import es.upm.dit.isst.bookadvisor.dao.model.Book;

public interface BookDao {
	public void createBook(Book book);
	public Book readBook(String isbn);
	public List<Book> readAllBooks();
	public List<Book> readBooksBasicSearch(String searchparameter);
	public List<Book> readBooksAdvancedSearch(String title, String author, String isbn, String publisher);
	public List<Book> readNewBooks(int nBooks);
	public List<Book> readBestBooks(int nBooks);
	public void updateBook(Book book);
	public void deleteBook(Book book);
}
