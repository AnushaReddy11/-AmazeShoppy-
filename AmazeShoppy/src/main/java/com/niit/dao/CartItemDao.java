package com.niit.dao;
import java.util.List;

import com.niit.product.CartItem;
import com.niit.product.CustomerOrder;
import com.niit.product.User;

public interface CartItemDao {
void addToCart(CartItem cartItem);

User getUser(String email);
List<CartItem>  getCart(String email);//select * from cartitem where user_email=?
void removeCartItem(int cartItemId);
CustomerOrder createCustomerOrder(CustomerOrder customerOrder);
}
