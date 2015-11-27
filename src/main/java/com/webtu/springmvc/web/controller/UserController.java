package com.webtu.springmvc.web.controller;



import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.webtu.springmvc.model.Reply;
import com.webtu.springmvc.model.Review;
import com.webtu.springmvc.model.User;
import com.webtu.springmvc.model.dao.ReviewDao;
import com.webtu.springmvc.model.dao.UserDao;

@SessionAttributes(value={"reviews","thisuser"})
@Controller
public class UserController {

	private static final Logger logger = Logger.getLogger(UserController.class);
	HttpServletRequest request;
	Review r = new Review();
	Reply newreply =new Reply();
    @Autowired
    private UserDao userDao;
    
    @Autowired
    private ReviewDao reviewDao;


    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String login()
    {
    	
        return "login";
    }
   
    @RequestMapping(value={"/home","/"},method = RequestMethod.GET)
    public String home(ModelMap models, Principal principal)//principal to get user info after thay login
    {
    	//logs debug message
    			if(logger.isDebugEnabled()){
    				logger.debug("getWelcome is executed!");
    			}
    			
    			//logs exception
    			logger.error("This is Error message", new Exception("Testing"));
    	
    	//when user click home show all the reviews so set reviews to show all before send to home
    	models.put( "reviews",reviewDao.getAllReview());
    	
    	String name = principal.getName();
    	//put user in session attribute
    	models.put("thisuser", userDao.getUser(name));

        return "home";
    }
    
    @RequestMapping("/register")
    public String register( )
    {
    	
        return "register";
    }
    
    @RequestMapping(value="/register",method = RequestMethod.POST)
    public String register(ModelMap models )
    {
    	
        return "register";
    }
    
    @RequestMapping(value = "/newReview",method = RequestMethod.GET)
    public String newreview( ModelMap models )
    {
    	//check whther user have alr login
    	//create a new model for review
    	models.put("newreview", new Review());
        return "newReview";
    }
    @RequestMapping(value = "/newReview",method = RequestMethod.POST)
    public String newreview(@ModelAttribute("newreview") Review review, @ModelAttribute("thisuser") User user )
    {
    	
    	review.setUser(user);
    	r=reviewDao.saveReview(review,user);
        return "redirect:/home";
    }
    //show review page with all its reply
    @RequestMapping(value = "/review", method = RequestMethod.GET)
    public String review(@RequestParam("reviewid") Integer reviewid, ModelMap models, Principal principal ){
    	
    	models.put("review", reviewDao.getReview(reviewid));
    	
    	List<Review> reply = reviewDao.getAllReplyToThisReview(reviewid);
    	models.put("reply", reply);
    	List<Review> allReply = reviewDao.getAllReply(reviewid);
    	models.put("inReply", allReply);
    	
    	return "review";
    }
    @RequestMapping(value = "/review", method = RequestMethod.POST, params ="reply1")
    public String review(@RequestParam("reviewid") Integer reviewid,ModelMap models){
    	
    	models.put("review", reviewDao.getReview(reviewid));
    	models.put("newReply", new Review());
    	return "reply";
    }
    
    @RequestMapping(value = "/review", method = RequestMethod.POST, params ="reply2")
    public String review(@RequestParam("reviewid") Integer reviewid,ModelMap models
    		,@RequestParam("reId") Integer replyid){

    	//head review id
    	models.put("review", reviewDao.getReview(reviewid));
    	//reply in reply id
    	models.put("inreply", reviewDao.getReview(replyid));
    	models.put("newReply", new Review());
    	return "reply";
    }
    
    	//save review and reply
       @RequestMapping(value= "/reply",method = RequestMethod.POST)
       public String reply(@ModelAttribute("newReply") Review reply, ModelMap models ,@ModelAttribute("thisuser") User user
    		,@RequestParam("inreply") Integer inreply, @RequestParam("reviewid") Integer reviewid){
    	
    	reply.setUser(user);
    	if(inreply != null)
    		reply.setInReply(inreply);
    	else
    		reply.setInReply(reviewid);
    	r=reviewDao.saveReview(reply,user);
    	return"redirect:/review?reviewid="+reviewid;
    }
    
    @RequestMapping("/reviewsbyme")
    public String allreviewbyme( ModelMap models, @ModelAttribute("thisuser") User user){
    	
    	//set reviews and send back to home.jsp
    	models.put("reviews", reviewDao.getAllReviewByUser(user));
    	return "home";
    }
    
    @RequestMapping("/reviewireplied")
    public String allreviewireply(ModelMap models, @ModelAttribute("thisuser") User user){
    	models.put("reviews", reviewDao.getAllReviewThatIReply(user));
    	return "home";
    }
}