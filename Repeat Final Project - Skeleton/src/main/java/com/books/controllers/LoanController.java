package com.books.controllers;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.books.exceptions.NotCIdException;
import com.books.exceptions.NotBIdException;
import com.books.exceptions.NullCIdException;
import com.books.exceptions.NullBIdException;
import com.books.exceptions.LnException;
import com.books.models.Book;
import com.books.services.BookService;

@RequestMapping("/secure/loans/")
@Controller
public class LoanController<LoanService> {
	
	@Autowired
	@Qualifier("LoanService")
	LoanService loanServ;

	@GetMapping(value = "/showLoans")
	public String getAllCustomers(Model model){
		model.addAttribute("AllLoans", loanServ.getLoans());
		return "allLoans";
	}
	
	
	@RequestMapping(value = "/addLoan", method = RequestMethod.GET)
	public String getProduct(Model model){
		
		Loan prod = new Loan();
		model.addAttribute("Loan", prod);
	
		
		return "addLoan";
	}

	@RequestMapping(value = "/addLoan",method=RequestMethod.POST)
	public String submitProduct(@Valid @ModelAttribute ("Loan") Loan loan, BindingResult result,HttpServletRequest request, Model m)
	{
		if (result.hasErrors()) {
			return "addLoan";
		}
		else{
			
		
		
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			Date date = new Date();
			
			loan.setLoanDate(dateFormat.format(date));
			
			try{
				
				loanServ.addLoan(loan);
				System.out.println(loan.toString());
			
				return "redirect:showLoans";
			}catch (NullCIdException | NullBIdException | NotCIdException | NotBIdException | LnException e) {
				e.printStackTrace();
				e.getMessage();
				
				
				
				m.addAttribute("message", e.getMessage());
				m.addAttribute("cid", loan.getCust().getcId());
				m.addAttribute("bid", loan.getbook().getbId());
				m.addAttribute("ln", loan.getLn());
				return "databaseError";
			}
		
		
		}
	}

}
