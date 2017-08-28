package com.books.services;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.exceptions.NotCIdException;
import com.books.exceptions.NotBIdException;
import com.books.exceptions.NullCIdException;
import com.books.exceptions.NullBIdException;
import com.books.exceptions.LnException;
import com.books.models.Customer;
import com.books.models.Loan;
import com.books.models.Book;
import com.books.repositories.CustomerDAO;
import com.books.repositories.LoanDAO;
import com.books.repositories.BookDAO;


@Service("LoanService")
public class LoanService {

	@Autowired
	private LoanDAO repo;
	
	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private CustomerDAO customerDAO;
	
	private Customer cust;
	private Book book;
	

	private DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	private Date date = new Date();
	
	
	public void addLoan(Loan loan) throws NullCIdException, NullBIdException, NotCIdException , NotBIdException , LnException{
		
		
		cust=loan.getCust();
		book=loan.getBook();
		
		if (cust.getcId() == null) {
			
			throw new NullCIdException("No Customer entered");
		} else if (book.getBid() == null) {
		

			throw new NullBIdException("No Book entered");
		}
			
		cust = customerDAO.findOne(loan.getCust().getcId());
		book = bookDAO.findOne(loan.getBook().getBid());
			
			
		if  (cust==null) {
			cust = loan.getCust();
			throw new NotCIdException("Customer doesnt exist:"+cust.getcId());
		} else if (book==null) {
			book = loan.getBook();
			cust = loan.getCust();
			throw new NotBIdException("Book doesnt exist :"+loan.getBook().getBid()+"or Customer doesnt exist:"+loan.getCust().getcId());
		}
		
		else if (loan.getLid() > book.getLidInStock()) {
			throw new LnException("Not enough stock ");
		}
		

		else{
			
					
		    loan.setDueDate(dateFormat.format(date));			 
			loan.getCust().setcName(cust.getcName());
			
			
			
			repo.save(loan);
		}
		
	}
		
	
	public ArrayList<Loan> getLoans(){
		System.out.print("Trying to retrieve books from DB");
		return (ArrayList<Loan>) repo.findAll();
	}

}



