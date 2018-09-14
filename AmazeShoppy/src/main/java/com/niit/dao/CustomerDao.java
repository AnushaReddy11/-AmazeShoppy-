package com.niit.dao;

import com.niit.product.Customer;

public interface CustomerDao {
	void registerCustomer(Customer customer);
	boolean isEmailUnique(String email);
}
