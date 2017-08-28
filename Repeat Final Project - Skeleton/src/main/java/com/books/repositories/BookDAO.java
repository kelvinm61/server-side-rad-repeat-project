package com.books.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.books.models.Book;

@Repository
public interface BookDAO extends JpaRepository<Book, Long> {

	public Book findBypId(String bId);
}


