package com.webtu.springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.webtu.springmvc.model.User;
import com.webtu.springmvc.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	private EntityManager entityManager;
	 
	@Override
	public User getUser(Integer id) {
		
		return entityManager.find(User.class, id);
	}

	@Override
	public User getUser(String username) {

    	Query q =entityManager.createQuery("from User where username= :username");
        q.setParameter("username", username);
    	return (User) q.getSingleResult(); 
	}
	
	@Transactional
	@Override
	public List<User> getUsers() {
		
		return entityManager.createQuery("from User order by id", User.class).getResultList();
	}
	
	@Transactional
	 @Override
	 public User saveUser( User user )
	    {
	        return entityManager.merge( user );
	    }

}
