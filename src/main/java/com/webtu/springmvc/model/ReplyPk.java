//package com.webtu.springmvc.model;
//
//import java.io.Serializable;
//
//import javax.persistence.Column;
//import javax.persistence.Embeddable;
//import javax.persistence.ManyToOne;
//
//@Embeddable
//public class ReplyPk implements Serializable {
//	
//	private static final long serialVersionUID = 1L;
//	
//	//same name as on DB
//	private int review_id;
//	
//	private int user_id;
//	
//	@ManyToOne
//	public int getReview_id() {
//		return review_id;
//	}
//	public void setReview_id(int review_id) {
//		this.review_id = review_id;
//	}
//	
//	@ManyToOne
//	public int getUser_id() {
//		return user_id;
//	}
//	public void setUser_id(int user_id) {
//		this.user_id = user_id;
//	}
//	
//	 public boolean equals(Object o) {
//		 	if (this== o) return true;
//	        if (o ==null|| getClass() != o.getClass()) return false;
//
//	        ReplyPk that = (ReplyPk) o;
//
////	        if (userId !=null?!users.equals(that.users) : that.users !=null) return false;
////	        if (review !=null?!review.equals(that.review) : that.review !=null)
////	            return false;
//
//	        return true;
//	    }
//
//	    public int hashCode() {
//	    	int result =0;
////	        result = (users !=null? users.hashCode() : 0);
////	        result =31* result + (review !=null? review.hashCode() : 0);
//	        return result;
//	    }
//
//}
