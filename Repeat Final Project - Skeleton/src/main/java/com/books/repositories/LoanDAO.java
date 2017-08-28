package com.books.repositories;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.books.models.Customer;
import com.books.models.Loan;
import com.books.models.Book;


@Repository
public interface LoanDAO extends JpaRepository<Loan, Long> {

	public List<Loan> findBycust(Customer cust);
}


