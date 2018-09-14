package com.niit.amazeshoppy;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.ProductDao;
import com.niit.dao.ProductDaoImp;
import com.niit.product.Product;

public class MainDb {
	public static void main(String args[])
	{
		ApplicationContext context=new AnnotationConfigApplicationContext(DbConfig.class,ProductDaoImp.class);
		ProductDao productDao=(ProductDao)context.getBean("productDaoImp");
		Product product=new Product();
        product.setProductName("Guitar");	
        product.setProductDesc("Accoustic");
        product.setPrice(2000);
	    product.setQuantity(1);
	    productDao.saveProduct(product);
		//productDao.deleteProduct(42);
		/*List<Product> products=productDao.getAllProducts();
		for(Product p:products){
			System.out.println(p.getId() +" " +p.getPrice() +" " +p.getProductDesc() + " " +p.getProductName() + " " +p.getQuantity() + " ");
		}*/
	}
	

}
