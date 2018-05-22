package es.upm.dit.isst.bookadvisor.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.upm.dit.isst.bookadvisor.dao.model.Book;
import es.upm.dit.isst.bookadvisor.dao.SessionFactoryService;

public class BookDaoImplementation implements BookDao {

	private static BookDaoImplementation instance = null;

	private BookDaoImplementation() {
	};

	public static BookDaoImplementation getInstance() {
		if (null == instance) {
			instance = new BookDaoImplementation();
		}

		return instance;
	}

	@Override
	public void createBook(Book book) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.save(book);
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
	}

	@Override
	public Book readBook(String isbn) {
		Session session = SessionFactoryService.get().openSession();
		Book book = null;
		try {
			session.beginTransaction();
			book = (Book) session.createQuery("select b from Book b where b.isbn= :isbn").setParameter("isbn", isbn)
					.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}

		return book;
	}

	@Override
	public List<Book> readAllBooks() {
		List<Book> books = new ArrayList<>();
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			books.addAll(session.createQuery("from Book").list());
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}

		return books;
	}

	@Override
	public void updateBook(Book book) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(book);
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteBook(Book book) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.delete(book);
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}
	}

	@Override
	public List<Book> readBooksBasicSearch(String searchparameter) {
		List<Book> books = new ArrayList<>();
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			books.addAll(session.createQuery(
					"select b from Book b where b.title like :param or b.author like :param or b.isbn like :param")
					.setParameter("param", "%"+searchparameter+"%")
					.getResultList());
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}

		return books;
	}

	@Override
	public List<Book> readBooksAdvancedSearch(String title, String author, String isbn, String publisher) {
		List<Book> books = new ArrayList<>();
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			books.addAll(session.createQuery(
					"select b from Book b where b.title like :title and b.author like :author and b.isbn like :isbn and b.publisher like :publisher")
					.setParameter("title", "%"+title+"%")
					.setParameter("author", "%"+author+"%")
					.setParameter("isbn", "%"+isbn+"%")
					.setParameter("publisher", "%"+publisher+"%")
					.getResultList());
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}

		return books;
	}

	@Override
	public List<Book> readNewBooks(int nBooks) {
		List<Book> books = new ArrayList<>();
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			books.addAll(session.createQuery(
					"select b from Book b where b.newBook= :new order by publishDate desc")
					.setParameter("new", true)
					.setMaxResults(nBooks)
					.getResultList());
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}

		return books;
	}

	@Override
	public List<Book> readBestBooks(int nBooks) {
		List<Book> books = new ArrayList<>();
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			books.addAll(session.createQuery(
					"select b from Book b order by rating desc")
					.setMaxResults(nBooks)
					.getResultList());
			session.getTransaction().commit();
		} catch (Exception e) {
			// manejar excepciones
		} finally {
			session.close();
		}

//		System.out.println("LIBROS CONSULTA BOOKS");
//		for(Book b: books) {
//			System.out.println(b.getTitle()+" -> "+b.getRating());
//		}
		
		return books;
	}
	
	

}
