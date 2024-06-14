package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Itemdetails;

public class ItemDAOImpl implements ItemDAO {
	
	private Connection conn;
	
	

	public ItemDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean additem(Itemdetails i) {
		
		boolean f=false;
		 try {
			 String mysql = "insert into itemdetails(itemName,price,itemCategory,status,photo,userEmail) value(?,?,?,?,?,?)";
			 PreparedStatement ps =conn.prepareStatement(mysql);
			 ps.setString(1,i.getItemName());
			 ps.setString(2,i.getPrice());
			 ps.setString(3,i.getItemCategory());
			 ps.setString(4,i.getStatus());
			 ps.setString(5,i.getPhoto());
			 ps.setString(6,i.getUserEmail());
			 
			 int j=ps.executeUpdate();
			 
			 if(j==1)
			 {
				 f=true;
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Itemdetails> getallitems() {
		
		List<Itemdetails> list = new ArrayList<Itemdetails>();
		Itemdetails i=null;
		
		try {
			
			String sql="select * from itemdetails";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				i=new Itemdetails();
				i.setItemId(rs.getInt(1));
				i.setItemName(rs.getString(2));
				i.setPrice(rs.getString(3));
				i.setItemCategory(rs.getString(4));
				i.setStatus(rs.getString(5));
				i.setPhoto(rs.getString(6));
				i.setUserEmail(rs.getString(7));
				list.add(i);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
		public Itemdetails getitembyId(int id) {
			
			Itemdetails i=null;
			
			try {
				String sql = "select * from itemdetails where itemId=?";
				PreparedStatement ps =conn.prepareStatement(sql);
				ps.setInt(1, id);
				
				ResultSet rs=ps.executeQuery();
			    while(rs.next())
			    {
			    	i=new Itemdetails();
			    	i.setItemId(rs.getInt(1));
					i.setItemName(rs.getString(2));
					i.setPrice(rs.getString(3));
					i.setItemCategory(rs.getString(4));
					i.setStatus(rs.getString(5));
					i.setPhoto(rs.getString(6));
					i.setUserEmail(rs.getString(7));
			    }
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return i;
			
		}

	public boolean updateEditItems(Itemdetails i) {
		 boolean f=false;
				 
		try {
			 String sql= "update itemdetails set itemName=?,price=?,status=? where itemId=?";
			 PreparedStatement ps =conn.prepareStatement(sql);
			 ps.setString(1, i.getItemName());
			 ps.setString(2, i.getPrice());
			 ps.setString(3, i.getStatus());
			 ps.setInt(4, i.getItemId());
			 
			 int j=ps.executeUpdate();
			 if(j==1)
			 {
				 f=true;
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteitems(int id) {
		boolean f=false;
		
		try {
			String sql = "delete from itemdetails where itemId=? ";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, id);
			int j=ps.executeUpdate();
			
			
			if(j==1)
			{
				f=true;
			}
				
		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}

	public List<Itemdetails> getNewItem() {
		
		
		List<Itemdetails> list =new ArrayList<Itemdetails>();
		Itemdetails i=null;
		
		try {
			String sql ="select * from itemdetails where itemCategory=? and status=? order by itemId DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Accessories" );
			ps.setString(2, "Active");
			ResultSet rs= ps.executeQuery();
			int j=1;
			
			while(rs.next() && j<=4)
			{
				i=new Itemdetails();
				i.setItemId(rs.getInt(1));
				i.setItemName(rs.getString(2));
				i.setPrice(rs.getString(3));
				i.setItemCategory(rs.getString(4));
				i.setStatus(rs.getString(5));
				i.setPhoto(rs.getString(6));
				i.setUserEmail(rs.getString(7));
				list.add(i);
				j++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Itemdetails> getAllItems() {
		List<Itemdetails> list =new ArrayList<Itemdetails>();
		Itemdetails i=null;
		
		try {
			String sql ="select * from itemdetails where status=? order by itemId DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs= ps.executeQuery();
			int j=1;
			
			while(rs.next() && j<=4)
			{
				i=new Itemdetails();
				i.setItemId(rs.getInt(1));
				i.setItemName(rs.getString(2));
				i.setPrice(rs.getString(3));
				i.setItemCategory(rs.getString(4));
				i.setStatus(rs.getString(5));
				i.setPhoto(rs.getString(6));
				i.setUserEmail(rs.getString(7));
				list.add(i);
				j++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
		
		
		
	}

	public List<Itemdetails> getALLHelmets() {
		
		
		List<Itemdetails> list =new ArrayList<Itemdetails>();
		Itemdetails i=null;
		
		try {
			String sql ="select * from itemdetails where itemCategory=? and status=? order by itemId DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Helmets" );
			ps.setString(2, "Active");
			ResultSet rs= ps.executeQuery();
			
			while(rs.next())
			{
				i=new Itemdetails();
				i.setItemId(rs.getInt(1));
				i.setItemName(rs.getString(2));
				i.setPrice(rs.getString(3));
				i.setItemCategory(rs.getString(4));
				i.setStatus(rs.getString(5));
				i.setPhoto(rs.getString(6));
				i.setUserEmail(rs.getString(7));
				list.add(i);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
		
		
	}

	public List<Itemdetails> getAllJackets() {
		List<Itemdetails> list =new ArrayList<Itemdetails>();
		Itemdetails i=null;
		
		try {
			String sql ="select * from itemdetails where itemCategory=? and status=? order by itemId DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Jackets" );
			ps.setString(2, "Active");
			ResultSet rs= ps.executeQuery();
			
			while(rs.next())
			{
				i=new Itemdetails();
				i.setItemId(rs.getInt(1));
				i.setItemName(rs.getString(2));
				i.setPrice(rs.getString(3));
				i.setItemCategory(rs.getString(4));
				i.setStatus(rs.getString(5));
				i.setPhoto(rs.getString(6));
				i.setUserEmail(rs.getString(7));
				list.add(i);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

	public List<Itemdetails> getAllProducts() {
		
		List<Itemdetails> list =new ArrayList<Itemdetails>();
		Itemdetails i=null;
		
		try {
			String sql ="select * from itemdetails where itemCategory in (?, ?, ?) and status=? order by itemId DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Jackets" );
			ps.setString(2,"Accessories" );
			ps.setString(3,"Helmets" );
			ps.setString(4, "Active");
			ResultSet rs= ps.executeQuery();
			
			while(rs.next())
			{
				i=new Itemdetails();
				i.setItemId(rs.getInt(1));
				i.setItemName(rs.getString(2));
				i.setPrice(rs.getString(3));
				i.setItemCategory(rs.getString(4));
				i.setStatus(rs.getString(5));
				i.setPhoto(rs.getString(6));
				i.setUserEmail(rs.getString(7));
				list.add(i);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

	public List<Itemdetails> getItemBySearch(String ch) {
		
		List<Itemdetails> list = new ArrayList<Itemdetails>();
		Itemdetails i=null;
		try {
			String sql = "select * from itemdetails where (itemName like ? or itemCategory like ?) and status=? ";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "Active");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				i=new Itemdetails();
				i.setItemId(rs.getInt(1));
				i.setItemName(rs.getString(2));
				i.setPrice(rs.getString(3));
				i.setItemCategory(rs.getString(4));
				i.setStatus(rs.getString(5));
				i.setPhoto(rs.getString(6));
				i.setUserEmail(rs.getString(7));
				list.add(i);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}


		


		

}
