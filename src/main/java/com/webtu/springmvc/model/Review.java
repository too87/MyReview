package com.webtu.springmvc.model;


import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="reviews")
public class Review implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private Integer review_id;
	
	@Column(name="topic")
	private String topic;
	
	@Column(name="description")
	private String description;
	
	@Column(name="tag")
	private String tag;


	@ManyToOne(cascade = CascadeType.ALL)
	private User user;
	
	private Integer inReply=null;
	//for manytomany
	@OneToMany(mappedBy = "review") //map to name in Reply class
	List<Reply> reply;
	
	public Review(){
		
	}

	public Integer getReview_id() {
		return review_id;
	}

	public void setReview_id(Integer review_id) {
		this.review_id = review_id;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Integer getInReply() {
		return inReply;
	}

	public void setInReply(Integer inReply) {
		this.inReply = inReply;
	}

	public List<Reply> getReply() {
		return reply;
	}

	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}
	
	
}
