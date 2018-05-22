package es.upm.dit.isst.bookadvisor.test;

import es.upm.dit.isst.bookadvisor.dao.ExchangeDaoImplementation;
import es.upm.dit.isst.bookadvisor.dao.model.Exchange;

public class Test {

	public static void main(String[] args) {
		Exchange e = new Exchange();
		e.setId("asdas");
		ExchangeDaoImplementation.getInstance().createExchange(e);
		
	}

}
