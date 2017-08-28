package com.books.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.books.models.Customer;
import com.books.models.Loan;
import com.books.models.Book;


@Repository
public interface CustomerDAO extends JpaRepository<Customer, Long> {

	public Book findBycId(String bId);
}


