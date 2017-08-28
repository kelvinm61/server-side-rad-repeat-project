package com.books.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.models.Customer;
import com.books.models.Loan;
import com.books.models.Book;
import com.books.repositories.CustomerDAO;
import com.books.repositories.LoanDAO;
import com.books.repositories.BookDAO;

@Service("CustService")
public class CustomerService {

	private static final LoanDAO LoanRepo = null;

	@Autowired
	private CustomerDAO repo;
	
	@Autowired
	private LoanDAO orderRepo;
	
	private ArrayList<Customer> customers;
	public void addCust(Customer c){
		try {
			repo.save(c);
			
		} catch (Exception exc) {
			
		}
	}
		
	
	public ArrayList<Customer> getCustomers(){
		System.out.print("retrieving books from DB");
		customers = (ArrayList<Customer>) repo.findAll();
		
		
		for(Customer cust : customers){
			cust.setLoans(getCustomersLoans(cust));
		}
		
		return (ArrayList<Customer>) customers;
	}
	
	public ArrayList<Loan> getCustomersLoans(Customer cust){
		System.out.print("Retreiving customer loans now \n\n\n\n\n\n\n");
		
		return (ArrayList<Loan>) LoanRepo.findBycust(cust);
	}

}



