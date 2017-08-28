package com.books.controllers;

import java.awt.print.Book;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.books.models.Customer;
import com.books.models.Book;
import com.books.services.BookService;

@RequestMapping("/secure/books/")
@Controller
public class BookController<BookService> {
	
	
	@Autowired
	@Qualifier("bookService")
	BookService bookServ;
	
	
	@GetMapping(value = "/showBooks")
	public String getAllBooks(Model model){
		model.addAttribute("AllBooks", bookServ.getBooks());
		return "allBooks";
	}
	
	
	@GetMapping(value = "/addBook")
	public String getBook(Model model){
	
		Book book = new Book();
		model.addAttribute("Book", book);
	
		
		return "addBook";
	}
	
	@RequestMapping(value = "/addBook",method=RequestMethod.POST)
	public String submitBook(@Valid @ModelAttribute ("Book") Book book, BindingResult result){
	
		bookServ.addBook(book);
		System.out.println(book.toString());
		
		if (result.hasErrors()) {
			return "addBook";
		}
	
		return "redirect:showBooks";
	}
}