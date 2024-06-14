package com.DAO;

import java.util.List;

import com.entity.Itemdetails;

public interface ItemDAO {
	
	public boolean additem(Itemdetails i);
	
	public List<Itemdetails> getallitems();
	
	public Itemdetails getitembyId(int id);
	
	public boolean updateEditItems(Itemdetails i);
	
	public boolean deleteitems(int id );
	
	public List<Itemdetails> getNewItem();
	
	public List<Itemdetails> getAllItems();
	
	public List<Itemdetails> getALLHelmets();
	
	public List<Itemdetails> getAllJackets();
	
	public List<Itemdetails> getAllProducts();
	
	public List<Itemdetails> getItemBySearch(String ch);
	

	
}
