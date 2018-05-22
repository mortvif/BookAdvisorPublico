package es.upm.dit.isst.bookadvisor.servlet;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import es.upm.dit.isst.bookadvisor.dao.BookDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.UserDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.Book;
import es.upm.dit.isst.bookadvisor.dao.model.BookFormat;
import es.upm.dit.isst.bookadvisor.dao.model.BookGenre;
import es.upm.dit.isst.bookadvisor.dao.model.User;
import es.upm.dit.isst.bookadvisor.dao.model.UserType;


@SuppressWarnings("serial")
@MultipartConfig
@WebServlet("/newBookServlet")
public class newBookServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("New Book Request");
		
		String title = req.getParameter("title");
		String author = req.getParameter("autor");
		String publisher = req.getParameter("editorial");
		String isbn = req.getParameter("isbn");
		String date = req.getParameter("date");
		String format = req.getParameter("format");
		String category = req.getParameter("category");
		String sypnosis = req.getParameter("comment");

		
		// Check if book with isbn already exits
		if(null != BookDaoImplementation.getInstance().readBook(isbn)) {
			resp.sendRedirect(req.getContextPath() + "/newbook.jsp");
			return;
		}
		
		//Handle file upload
		//gets absolute path of the web application
        String appPath = req.getServletContext().getRealPath("");       
		Date datenow = new Date();
		DateFormat df = new SimpleDateFormat("ddMMyyyyHHmmss");
        String savePath = appPath + "images/covers";

        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        Part filePart = req.getPart("cover");
        String fileName = title + df.format(datenow)+".jpg";
        fileName = new File(fileName).getName();
        filePart.write(savePath + File.separator + fileName);
        
        // Getting user info from Cookie
        User u = null;
		Cookie[] cs = req.getCookies();
		if(cs != null) {
			for(Cookie c: cs) {
				if(c.getName().equals("bookadvisorUser")) {
					u = UserDaoImplementation.getInstance().getUser(c.getValue());
				}
			}
			
			if(u == null ) {
				// No hay usuario logeado
				resp.sendRedirect(req.getContextPath() + "/newbook.jsp");
			} else {
				// Creating book
		        Book book = new Book();
		        book.setTitle(title);
		        book.setAuthor(author);
		        book.setPublisher(publisher);
		        book.setIsbn(isbn);
		        book.setCoverPath(fileName);
		        book.setCreatedBy(u);
		        if(u.getRole() == UserType.PUBLISHER) {
		        	book.setNewBook(true);
		        }else {
		        	book.setNewBook(false);
		        }
		        
		        book.setnRated(0);
		        book.setRating(0);
		        book.setSynopsis(sypnosis);
		        
		        if(category.equals("ficcion")) {
	        		book.setGenre(BookGenre.FICTION);		        	
		        } else if(category.equals("no ficcion")) {
	        		book.setGenre(BookGenre.NONFICTION);
		        } else {
	        		book.setGenre(BookGenre.FICTION);
		        }
		        
		        if(format.equals("tapa blanda")) {
	        		book.setFormat(BookFormat.PAPERBACK);
		        } else if (format.equals("tapa dura")) {
	        		book.setFormat(BookFormat.HARDCOVER);
		        } else {
	        		book.setFormat(BookFormat.PAPERBACK);
		        }
		        
		        // Parse date
				DateFormat dateparser = new SimpleDateFormat("dd/MM/yyyy");
		        try {
					book.setPublishDate(dateparser.parse(date));
		        } catch(Exception e) {
		        	System.out.println(e);
		        }
		        	
		        BookDaoImplementation.getInstance().createBook(book);
		        
		        req.getSession().setAttribute("book", book);
				resp.sendRedirect(req.getContextPath() + "/bookdetails.jsp");
			}
				
		}

    }

}
