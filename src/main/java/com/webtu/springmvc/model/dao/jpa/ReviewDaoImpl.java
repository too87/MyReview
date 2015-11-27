package com.webtu.springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.webtu.springmvc.model.Review;
import com.webtu.springmvc.model.User;
import com.webtu.springmvc.model.dao.ReviewDao;


@Repository
public class ReviewDaoImpl implements ReviewDao{

	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<Review> getAllReview() {
		
		return entityManager.createQuery("from Review where inReply = null order by review_id", Review.class).getResultList();
	}
	
	@Override
	public Review getReview(Integer review_id){
		return entityManager.find(Review.class, review_id);
	}

	@Transactional
	@Override
//	@PreAuthorize("principal.username == #user.username")
	public Review saveReview(Review review, User user) {//have user for principle later on
		
		return entityManager.merge(review);
	}

	@Override
	public List<Review> getAllReplyToThisReview(Integer review_id) {
		Query q = entityManager.createQuery("from Review where inReply is not null and inReply=:review_id");
		q.setParameter("review_id", review_id);
		return q.getResultList();
	}

	@Override
	public List<Review> getAllReply(Integer review_id) {
		Query q = entityManager.createQuery("from Review where topic is null and inReply <>:review_id");
		q.setParameter("review_id", review_id);
		return q.getResultList();
		
	}

	@Override
	public List<Review> getAllReviewByUser(User user) {
		
		Query q = entityManager.createQuery("from Review where inReply = null and user_user_id =:user_id");
		q.setParameter("user_id", user.getUser_id());
		return q.getResultList();
	}

	@Override
	public List<Review> getAllReviewThatIReply(User user) {
		
		Query q = entityManager.createQuery("from Review where inReply <> null and user_user_id =:user_id");
		q.setParameter("user_id", user.getUser_id());
		return q.getResultList();
	}

}
