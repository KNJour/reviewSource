package com.keith.reviews.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.keith.reviews.models.Genre;
import com.keith.reviews.models.LoginUser;
import com.keith.reviews.models.Media;
import com.keith.reviews.models.Review;
import com.keith.reviews.models.User;
import com.keith.reviews.repositories.GenreRepository;
import com.keith.reviews.repositories.MediaRepository;
import com.keith.reviews.repositories.ReviewRepository;
import com.keith.reviews.repositories.UserRepository;

@Service
public class ReviewService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ReviewRepository reviewRepository;
	@Autowired
	private MediaRepository mediaRepository;
	@Autowired
	private GenreRepository genreRepository;
//Registration ***
	
    public User register(User newUser, BindingResult result) {
    	//checks to see if email already exists in database
        if(userRepository.findByEmail(newUser.getEmail()).isPresent()) {
            result.rejectValue("email", "Unique", "This email is already in use!");
        }
        //checks to see if the password matches the confirmpassword inputs
        if(!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }
        if(result.hasErrors()) {
            return null;
        } else {
        	//hashes and salts the password, saves the password, then saves our new user
            String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
            newUser.setPassword(hashed);
            return userRepository.save(newUser);
        }
    }
    
  //Login***
    public User login(LoginUser newLogin, BindingResult result) {
        if(result.hasErrors()) {
            return null;
        }
        //find the user by email
        Optional<User> potentialUser = userRepository.findByEmail(newLogin.getEmail());
        //if the email is not in the database, provide error
        if(!potentialUser.isPresent()) {
            result.rejectValue("email", "Unique", "Unknown email!");
            return null;
        }
        //if email exists, check to see if password matches password in database
        User user = potentialUser.get();
        if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
            result.rejectValue("password", "Matches", "Invalid Password!");
        }
        if(result.hasErrors()) {
            return null;
        } else {
            return user;
        }
    }
     //find a user
    public  User findOneUser(Long id) {
    	Optional<User> user = userRepository.findById(id);
    	if (user.isPresent()) {
    		return user.get();
    	} else {
    		return null;
    	}
    }
    
    //save a user
    public User saveUser(User user) {
    	Optional<User> checkUser = userRepository.findById(user.getId());
    	if (checkUser.isPresent()) {
    		return userRepository.save(user);
    	} else {
    		
    		return null;
    	}
    }
    
    //update a user 
    
    public void updateUser(User user) {
    	Optional<User> checkUser = userRepository.findById(user.getId());
    	if (checkUser.isPresent()) {
        	User updatedUser = checkUser.get();
        	updatedUser.setUserName(user.getUserName());
        	updatedUser.setEmail(user.getEmail());
        	updatedUser.setBio(user.getBio());
        	userRepository.save(updatedUser);
    	} else {
    		
    		return;
    	}
    	return;
    }
    //Review & Genre
//    public Review assignGenre(Long reviewId, Long genreId) {
//        Genre thisGenre = findGenreById(genreId);
//        Review  thisReview = findProductById(productId);
//    }
    //REVIEW SERVICES

	public Review getOneReview(Long id) {
    	Optional<Review> optionalReview = this.reviewRepository.findById(id);
    	if(optionalReview.isPresent()) {
    		return optionalReview.get();
    	} else {
    		return null;
    	}
    }
    
    public List<Review>allReviews() {
    	return (List<Review>) reviewRepository.findAll();
    }
    
    public Review createReview(Review review) {
		return  reviewRepository.save(review);
		}
    
    public void deleteReview(Long id) {
    	this.reviewRepository.deleteById(id);
    }
   public Review getOneNewest() {
	   Review review = reviewRepository.findTopByOrderByIdDesc();
	   return review;
   }
   
   //50 Most Recent 
   
   public List<Review> getFiftyNewest() {
	   return (List<Review>) reviewRepository.findTop50ByOrderByCreatedAtDesc();
   }
   
   //Get Most Liked Videos
   public List<Review> getFiftyMostLiked() {
	   return (List<Review>) reviewRepository.findTop50ByOrderByLikesDesc();
   }
   
    //RANDOM REVIEW
   
public Review getOneRandom() {

	Long total = reviewRepository.count();
	int len = (int)(Math.random() * total);
	Page<Review> reviewPage = reviewRepository.findAll(PageRequest.of(len, 1));
	Review random = null;
	if (reviewPage.hasContent()) {
		random = reviewPage.getContent().get(0);
	}
	return random;
}
//    MEDIA SERVICES
    public Media getOneMedia(Long id) {
    	Optional<Media> optionalMedia = this.mediaRepository.findById(id);
    	if(optionalMedia.isPresent()) {
    		return optionalMedia.get();
    	} else {
    		return null;
    	}
    }
    
    public List<Media>allMedia() {
    	return (List<Media>) mediaRepository.findAll();
    }
    
    public Media createMedia(Media media) {
		return  mediaRepository.save(media);
		}
    
    public void deleteMedia(Long id) {
    	this.mediaRepository.deleteById(id);
    }
    //GENRE SERVICES
    public Genre getOneGenre(Long id) {
    	Optional<Genre> optionalGenre = this.genreRepository.findById(id);
    	if(optionalGenre.isPresent()) {
    		return optionalGenre.get();
    	} else {
    		return null;
    	}
    }
    public List<Genre>allGenres() {
    	return (List<Genre>) genreRepository.findAll();
	}
    
    public Genre createGenre(Genre genre) {
		return  genreRepository.save(genre);
		}
    
    public void deleteGenre(Long id) {
    	this.genreRepository.deleteById(id);
    }
}
