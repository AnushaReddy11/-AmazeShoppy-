package com.niit.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.product.Category;
import com.niit.product.Product;
@Repository
@Transactional
public class ProductDaoImp implements ProductDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public Product saveProduct(Product product) {
		Session session=sessionFactory.getCurrentSession();
		System.out.println("id of product before persisting"+product.getId());
		session.save(product);
		System.out.println("id of product after persisting"+product.getId());
		return product;
		
	}
 public ProductDaoImp(){
	 System.out.println("ProductDaoImp bean is created");
 }
	public Product getProduct(int id) {
	Session session=sessionFactory.getCurrentSession();
	Product product=(Product)session.get(Product.class, id);
	return product;
		
	}

	public void updateProduct(Product product) {
		Session session=sessionFactory.getCurrentSession();
		session.update(product);
		
	}

	public void deleteProduct(int id) {
		Session session=sessionFactory.getCurrentSession();
		Product product=(Product)session.get(Product.class, id);
		session.delete(product);
	}

	public List<Product> getAllProducts() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Product");
		 List<Product> products=query.list();
		return products;
	}
	public List<Category> getAllCategories() {
		
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Category");
		 List<Category> categories=query.list();
		return categories;
	}

	
	

	
}
