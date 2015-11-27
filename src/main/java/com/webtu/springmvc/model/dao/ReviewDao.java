package com.webtu.springmvc.model.dao;

import java.util.List;

import com.webtu.springmvc.model.Review;
import com.webtu.springmvc.model.User;

public interface ReviewDao {

	List<Review> getAllReview();

	Review getReview(Integer review_id);
	
	List<Review> getAllReplyToThisReview(Integer review_id);
	
	List<Review> getAllReply(Integer review_id);
	
	Review saveReview(Review review, User user) ;
	
	List<Review> getAllReviewByUser(User user);

	List<Review> getAllReviewThatIReply(User user);
}
