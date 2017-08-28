package com.books.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.models.Book;
import com.books.repositories.BookDAO;


@Service("BookService")
public class BookService {

	@Autowired
	private BookDAO repo;
	
	public void addBook(Book b){
		try {
			repo.save(b);
			
		} catch (Exception exc) {
			
		}
	}
		
	
	public ArrayList<Book> getBooks(){
		System.out.print("Trying to retreive books from DB");
		return (ArrayList<Book>) repo.findAll();
	}

}



