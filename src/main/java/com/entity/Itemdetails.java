package com.entity;

public class Itemdetails {
	private int itemId;
	private String itemName;
	private String price;
	private String itemCategory;
	private String status;
	private String photo;
	private String userEmail;
	public Itemdetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Itemdetails(String itemName, String price, String itemCategory, String status, String photo,
			String userEmail) {
		super();
		this.itemName = itemName;
		this.price = price;
		this.itemCategory = itemCategory;
		this.status = status;
		this.photo = photo;
		this.userEmail = userEmail;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Override
	public String toString() {
		return "Itemdetails [itemId=" + itemId + ", itemName=" + itemName + ", price=" + price + ", itemCategory="
				+ itemCategory + ", status=" + status + ", photo=" + photo + ", userEmail=" + userEmail + "]";
	}

}
