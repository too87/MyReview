package com.webtu.springmvc.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
@Entity
@Table(name="reply")
//@IdClass(ReplyPk.class)
public class Reply implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id 
	@GeneratedValue
	private int reply_id;
	
	@ManyToOne
	private User users;
	
	@ManyToOne
	private Review review;
//	//manytomany
//	@Id
//	private int user_id; //same name as on DB 
//	@Id
//	private int review_id;
//
//    @ManyToOne
//    @JoinColumn(name = "user_id", updatable = false, insertable = false)
//    private User users;
//	
//    @ManyToOne
//    @JoinColumn(name = "review_id", updatable = false, insertable = false)
//    private Review review;
    
	@Column(name = "detail")
    private String detail;
    
    public Reply(){
    	
    }

	

	public User getUsers() {
		return users;
	}

	public void setUsers(User user) {
		this.users = user;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	
}
