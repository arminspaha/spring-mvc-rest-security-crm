package com.spahic.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spahic.entity.Customer;
import com.spahic.service.CustomerService;

@RestController
@RequestMapping("/api")
public class CustomerRestController {
	
	// autowire the CustomerService
	@Autowired
	private CustomerService customerService;
	
	// add mapping for Get /customers
	@GetMapping("/customers")
	public List<Customer> getCustomers() {
		return customerService.getCustomers();
	}
	
	// add mapping for Get /customers
		@GetMapping("/customers/{customerId}")
		public Customer getCustomer(@PathVariable int customerId) {
			Customer theCustomer = customerService.getCustomer(customerId);
			
			if(theCustomer == null) {
				throw new CustomerNotFoundException("Customer id not found " + customerId);
			}
			
			return theCustomer;
		}
		
		@PostMapping("/customers")
		public Customer addCustomer(@RequestBody Customer theCustomer) {
			
			theCustomer.setId(0);
			
			customerService.saveCustomer(theCustomer);
			
			return theCustomer;
		}
		
		@PutMapping("/customers")
		public Customer updateCustomer(@RequestBody Customer theCustomer) {
			
			customerService.saveCustomer(theCustomer);
			
			return theCustomer;
		}
		
		@DeleteMapping("/customers/{customerId}")
		public String deleteCustomer(@PathVariable int customerId) {
			
			Customer theCustomer = customerService.getCustomer(customerId);
			
			if(theCustomer == null) {
				throw new CustomerNotFoundException("Customer id not found " + customerId);
			}
			
			customerService.deleteCustomer(customerId);
			
			return "Customer with Customer ID " + customerId + " has been deleted";
		}

}
