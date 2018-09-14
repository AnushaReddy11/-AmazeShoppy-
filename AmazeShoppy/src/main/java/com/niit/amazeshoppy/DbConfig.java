package com.niit.amazeshoppy;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.niit.product.Authorities;
import com.niit.product.BillingAddress;
import com.niit.product.CartItem;
import com.niit.product.Category;
import com.niit.product.Customer;
import com.niit.product.CustomerOrder;
import com.niit.product.Product;
import com.niit.product.ShippingAddress;
import com.niit.product.User;

@Configuration
@EnableTransactionManagement
public class DbConfig {
	@Bean(name="dataSource")
	public DataSource getDataSource()
	{
	
		DriverManagerDataSource datasource=new DriverManagerDataSource();
		datasource.setDriverClassName("org.h2.Driver");
		datasource.setUrl("jdbc:h2:tcp://localhost/~/test");
		datasource.setUsername("sa");
		datasource.setPassword("sa");
         return datasource;
	}
	public DbConfig()
	{
		System.out.println("DbConfig bean is created");
	}
	@Bean
	public  SessionFactory sessionFactory()
	{
		LocalSessionFactoryBuilder lsf=new LocalSessionFactoryBuilder(getDataSource());
		Properties hibernateProperties=new Properties();
		hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");
		hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		hibernateProperties.setProperty("hibernate.show_sql", "true");
		lsf.addProperties(hibernateProperties);
		Class classes[]=new Class[]{Product.class,Category.class,User.class,Customer.class,Authorities.class,BillingAddress.class,ShippingAddress.class,CartItem.class,CustomerOrder.class};
		System.out.println("SessionFactory bean"+lsf);
		
		return lsf.addAnnotatedClasses(classes).buildSessionFactory();
	
		
	}
	@Bean
	public HibernateTransactionManager hiberTransManagement()
	{
		return new HibernateTransactionManager(sessionFactory());
	}
	
}
