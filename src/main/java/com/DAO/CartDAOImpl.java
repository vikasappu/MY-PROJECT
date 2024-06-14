package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.Itemdetails;

public class CartDAOImpl implements CartDAO{

private Connection conn;
	
	public CartDAOImpl(Connection conn)
	{
		this.conn=conn;
	}
	
	
	
	public boolean addCart(Cart c) {
		boolean f=false;
		try {
			String  sql ="insert into cart (Iid,uid,itemname,price,totalprice) value (?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getIid());
			ps.setInt(2,c.getUid());
			ps.setString(3,c.getItemname());
			ps.setDouble(4, c.getPrice());
			ps.setDouble(5, c.getTotalprice());
			
			int j=ps.executeUpdate();
			if (j==1)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}



	public List<Cart> getItemByUser(int uid) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c=null;
		double totalprice=0;
		try {
			  String sql = "select * from cart where uid=?";
			  PreparedStatement ps = conn.prepareStatement(sql);
			  ps.setInt(1, uid);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setIid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setItemname(rs.getString(4));
				c.setPrice(rs.getDouble(5));
				
				totalprice= totalprice+rs.getDouble(6);
				c.setTotalprice(totalprice);
				
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	public boolean removeitem(int Iid ,int uid ) {
		boolean f=false ;
		try {
              String sql= "delete from cart where Iid=? and uid=? ";
			  PreparedStatement ps=conn.prepareStatement(sql);
			  ps.setInt(1, Iid);
			  ps.setInt(2, uid);
			
			int j = ps.executeUpdate();

			if (j==1)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
	

}
