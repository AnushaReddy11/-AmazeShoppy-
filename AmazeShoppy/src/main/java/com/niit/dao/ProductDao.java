package com.niit.dao;

import java.util.List;

import com.niit.product.Category;
import com.niit.product.Product;

public interface ProductDao {
	Product saveProduct(Product product);
	Product getProduct(int id);
	void updateProduct(Product product);
	void deleteProduct(int id);
	List<Product>getAllProducts();
	List<Category>getAllCategories();
}
