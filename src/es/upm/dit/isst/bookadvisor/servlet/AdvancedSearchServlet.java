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
import es.upm.dit.isst.bookadvisor.dao.model.User;

@WebServlet("/AdvancedSearchServlet")
public class AdvancedSearchServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Advanced Search");
		User u = null;
		Cookie[] cs = req.getCookies();
		if(cs != null) {
			for(Cookie c: cs) {
				if(c.getName().equals("bookadvisorUser")) {
					u = UserDaoImplementation.getInstance().getUser(c.getValue());
			
				}
			}
		}	
		
		String title = req.getParameter("titulo");
		String author = req.getParameter("autor");
		String publisher = req.getParameter("editorial");
		String isbn = req.getParameter("isbn");
		
		List<Book> results = BookDaoImplementation.getInstance().readBooksAdvancedSearch(title, author, isbn, publisher);
//		List<Book> results = BookDaoImplementation.getInstance().readAllBooks();
		
		if(results != null && results.size() > 0) {
			req.getSession().setAttribute("booklist", results);
			req.getSession().setAttribute("user", u);
			resp.sendRedirect(req.getContextPath() + "/searchresults.jsp");
		} else {
			req.getSession().setAttribute("user", u);
			resp.sendRedirect(req.getContextPath() + "/notfound.jsp");
		}
				

		
	}
	
}
