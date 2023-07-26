package com.awstest.awsInteg.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FactorialController {
	
	@GetMapping("/")
	public ResponseEntity<String> welcome() {
		return ResponseEntity.status(HttpStatus.OK).body("<h1 style='color:blue'>Welcome to factorial page!!<h1>");
	}
	
	@GetMapping("/factorial")
	public ResponseEntity<String> getMessage() {
		return ResponseEntity.status(HttpStatus.OK).body("<h1 style='color:blue'>The factorial home page works!!<h1>");
	}
	
	@GetMapping("/factorial/{number}")
	public ResponseEntity<String> getFactorial(@PathVariable String number) {
		int n=0;
		try {
			n=Integer.parseInt(number);
		}catch(NumberFormatException e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("<h1 style='color:red'>Unable to parse number to integer for given input '"+number+"'</h1>");
		}
		
		if(n>20) 
			return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("<h1 style='color:red'>The number should not be greater than 20. "
					+ "This is where the factorial calculatation using long as a datatype finishes</h1>");
		int m=n;
		long fact = n;
		while(--n>0)
			fact*=n;
		return ResponseEntity.status(HttpStatus.OK).body("<h1 style='color:green'>The factorial of '"+m+"' is "+fact+"</h1>");
	}
}