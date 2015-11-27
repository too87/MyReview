package com.webtu.springmvc.model.dao;

import java.util.List;

import com.webtu.springmvc.model.Reply;

public interface ReplyDao {
	
	List<Reply> getAllReplyOfTheReview(Integer review_id);

	Reply saveReply(Reply reply);
}
