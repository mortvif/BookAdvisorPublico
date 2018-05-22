package es.upm.dit.isst.bookadvisor.dao;

import java.util.List;

import es.upm.dit.isst.bookadvisor.dao.model.Book;
import es.upm.dit.isst.bookadvisor.dao.model.Exchange;
import es.upm.dit.isst.bookadvisor.dao.model.User;

public interface ExchangeDao {
	public Exchange getExchange(String id);
	public List<Exchange> getUserExchanges(User u);
	public List<User> getBookRequesters(Book book);
	public void createExchange(Exchange exchange);
	public void updateExchange(Exchange exchange);
	public void deleteExchange(Exchange exchange);
}
