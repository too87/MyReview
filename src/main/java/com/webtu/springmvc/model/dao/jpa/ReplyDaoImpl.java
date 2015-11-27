package com.webtu.springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.webtu.springmvc.model.Reply;
import com.webtu.springmvc.model.dao.ReplyDao;

@Repository
public class ReplyDaoImpl implements ReplyDao{


	@PersistenceContext
	private EntityManager entityManager;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Reply> getAllReplyOfTheReview(Integer review_id) {
		
		Query q = entityManager.createQuery("from Reply where review_review_id=:review_id");
		q.setParameter("review_id", review_id);
		return q.getResultList();
	}
	
	@Transactional
	 @Override
	 public Reply saveReply( Reply reply )
	    {
	        return entityManager.merge( reply );
	    }

}
