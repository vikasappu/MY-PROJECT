package com.DAO;

import java.util.List;

import com.entity.Cart;
import com.entity.Itemdetails;

public interface CartDAO {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getItemByUser(int uid);
	
	public boolean removeitem(int Iid,int uid);
	
	

}
