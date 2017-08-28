package com.books.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.books.models.Customer;
import com.books.services.CustomerService;
import com.books.services.BookService;

@RequestMapping("/secure/customers/")
@Controller
public class CustomerController {
	
	
	@Autowired
	@Qualifier("CustService")
	CustomerService custServ;
	
	
	@GetMapping(value = "/showCustomers")
	public String getAllCustomers(Model model){
		model.addAttribute("AllCustomers", custServ.getCustomers());
		return "allCustomers";
	}
	

	@GetMapping(value = "/addCustomer")
	public String getCustomer(Model model){
		
		Customer cust = new Customer();
		model.addAttribute("Customer", cust);
	
		
		return "addCustomer";
	}

	@RequestMapping(value = "/addCustomer",method=RequestMethod.POST)
	public String submitCustomer(@Valid @ModelAttribute ("Customer") Customer cust, BindingResult result){
		
		custServ.addCust(cust);
		System.out.println(cust.toString());
	
		if (result.hasErrors()) {
			return "addCustomer";
		}
	
		return "redirect:showCustomers";
	}
}