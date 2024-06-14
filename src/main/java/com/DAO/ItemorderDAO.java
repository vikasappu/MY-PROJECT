package com.DAO;

import java.util.List;

import com.entity.Itemorder;

public interface ItemorderDAO {
	
	public boolean saveOrder(List<Itemorder>ilist);
	
	public List<Itemorder> getItem(String email);
	
	public List<Itemorder> getAllOrder();


}
