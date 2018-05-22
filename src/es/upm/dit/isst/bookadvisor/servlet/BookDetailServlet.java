package es.upm.dit.isst.bookadvisor.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.bookadvisor.dao.BookDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.UserDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.Book;
import es.upm.dit.isst.bookadvisor.dao.model.Exchange;
import es.upm.dit.isst.bookadvisor.dao.model.User;

@SuppressWarnings("serial")
@WebServlet("/BookDetailServlet")
public class BookDetailServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		User u = null;
		Cookie[] cs = req.getCookies();
		if(cs != null) {
			for(Cookie c: cs) {
				if(c.getName().equals("bookadvisorUser")) {
					u = UserDaoImplementation.getInstance().getUser(c.getValue());
				}
			}
		}	
		
		Book b = BookDaoImplementation.getInstance().readBook(req.getParameter("isbn"));
		List <Exchange> book_exchanges = b.getExchanges();

		req.getSession().setAttribute("book", b);
		System.out.println("Detalles del libro: "+b.getTitle()+"\n");
		
		req.getSession().setAttribute("user", u);
		
		req.getSession().setAttribute("book_exchanges", book_exchanges);
		System.out.println("Intercambios del libro "+b.getTitle()+": "+book_exchanges.size()+"\n");
		System.out.println(book_exchanges.size()+" usuarios quieren el libro "+b.getTitle()+"\n");
		for(int i =0; i<book_exchanges.size();i++) {
			System.out.println(book_exchanges.get(i).getRequester().getUsername());
		}
		
		resp.sendRedirect(req.getContextPath() + "/bookdetails.jsp");
		
	}
	
}