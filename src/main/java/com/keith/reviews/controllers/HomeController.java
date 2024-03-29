package com.keith.reviews.controllers;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.keith.reviews.models.Data;
import com.keith.reviews.models.Genre;
import com.keith.reviews.models.LoginUser;
import com.keith.reviews.models.Media;
import com.keith.reviews.models.Movie_Result;
import com.keith.reviews.models.Review;
import com.keith.reviews.models.User;
import com.keith.reviews.services.ReviewService;
@Controller
public class HomeController {

    private ReviewService reviewService;

    public HomeController(ReviewService reviewService) {
    	this.reviewService = reviewService;

    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }

    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
    	if (session.getAttribute("user_id")  == null) {
    		return "redirect:/";
    	} else {
    		Review newestReview = reviewService.getOneNewest();
    		Review randomReview = reviewService.getOneRandom();
        	System.out.println(newestReview.getTitle());
    		model.addAttribute("user", reviewService.findOneUser((Long) session.getAttribute("user_id")));
    		System.out.println(randomReview.getTitle());
         	model.addAttribute("allReviews", reviewService.allReviews());
        	model.addAttribute("data", new Data());
        	model.addAttribute("newest", newestReview);
        	model.addAttribute("random", randomReview);
        	model.addAttribute("fiftyNew", reviewService.getFiftyNewest());
        	return "dashboard.jsp";
    	}
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser,
            BindingResult result, Model model, HttpSession session) {


    	//calling on the service method "register" to check if email is in DB and if passwords match.
        reviewService.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }

        //setting user_id into session
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/home";
    }
    	//Log out
    @GetMapping("/logout")
    public String logou(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    //Logging In
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
            BindingResult result, Model model, HttpSession session) {
        User user = reviewService.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("user_id", user.getId());
        return "redirect:/home";
    }
    //Creates a New Review, Media, or Genre. Media and Genre available to admin only.

    //REVIEW
    @GetMapping("/newReview")
    public String newReview(HttpSession session, Model model) {
    	User user = reviewService.findOneUser((Long) session.getAttribute("user_id"));
    	model.addAttribute("user", user);
    	model.addAttribute("review", new Review());
     	model.addAttribute("allGenres", reviewService.allGenres());
    	model.addAttribute("allMedia", reviewService.allMedia());
    	model.addAttribute("genre", new Genre());
    	System.out.println("USER INFO HEEEEERE " + session.getAttribute("user_id"));
    	return "newReview.jsp";
    }
    
    @PostMapping(value="/searchselected")
    public String newApiReview(@Valid @ModelAttribute("Movie_Result") Movie_Result movieresult, HttpSession session, Model model, BindingResult result) {
    	
    	if(result.hasErrors()) {
    		System.out.println("ERROR ERROR WILL ROBINSON");
    		User user = reviewService.findOneUser((Long) session.getAttribute("user_id"));
    	   	model.addAttribute("user", user);
        	model.addAttribute("review", new Review());
         	model.addAttribute("allGenres", reviewService.allGenres());
        	model.addAttribute("allMedia", reviewService.allMedia());
        	model.addAttribute("genre", new Genre());
    		return "newReview.jsp";
    	} else {
    		User user = reviewService.findOneUser((Long) session.getAttribute("user_id"));
    		System.out.println("ITS MADE IT");
    		
    	model.addAttribute("user", user);
    	model.addAttribute("review", new Review());
     	model.addAttribute("allGenres", reviewService.allGenres());
    	model.addAttribute("allMedia", reviewService.allMedia());
    	model.addAttribute("genre", new Genre());
    	Movie_Result aMovie = new Movie_Result(null, null, movieresult.getImage(), movieresult.getTitle(), movieresult.getDescription());
    	model.addAttribute("movie", aMovie);
    	
    	

    	//Getting Information from Rapid Api movie Details (provides description)
//        	HttpRequest request = HttpRequest.newBuilder()
//        			.uri(URI.create("https://movies-tvshows-data-imdb.p.rapidapi.com/?type=get-movie-details&imdb=" + id))
//        			.header("x-rapidapi-host", "movies-tvshows-data-imdb.p.rapidapi.com")
//        			.header("x-rapidapi-key", "350547b6cbmsha67e51b9f91f36ep11e770jsn17990603a3bd")
//        			.method("GET", HttpRequest.BodyPublishers.noBody())
//        			.build();
//        	HttpResponse<String> response;
    	
    	
//    	HttpRequest request = HttpRequest.newBuilder()
//    			.uri(URI.create("https://imdb8.p.rapidapi.com/auto-complete?q=" + id))
//    			.header("X-RapidAPI-Key", "350547b6cbmsha67e51b9f91f36ep11e770jsn17990603a3bd")
//    			.header("X-RapidAPI-Host", "imdb8.p.rapidapi.com")
//    			.method("GET", HttpRequest.BodyPublishers.noBody())
//    			.build();
//    	HttpResponse<String> response;
    	
    	return "newReview.jsp";
    	}
    }


    @PostMapping("/createReview")
    public String createReview(@Valid @ModelAttribute("review") Review review, @ModelAttribute("genre") Genre genre, BindingResult result ) {
       	System.out.println("HEEEEEEEEEEEEEEERE" + genre);
    	if(result.hasErrors()) {
    		return "newReview.jsp";
    	} else {
    		System.out.println("ITS MADE IT");
    		reviewService.createReview(review);
    		return "redirect:/home";
    	}
    }
    @RequestMapping(value="/delete/review/{id}")
    public String deleteReview(@PathVariable("id") Long id, Model model) {
    	reviewService.deleteReview(id);
    	return "redirect:/home";
    }

    // SHOW ONE REVIEW
    @RequestMapping(value="/reading/{id}")
    public String showReview(@PathVariable("id") Long id, HttpSession session, Model model) {
    	SimpleDateFormat formatter = new SimpleDateFormat("MMMMM dd,  yyyy");
    	Review review = reviewService.getOneReview(id);
    	Date date = review.getCreatedAt();
    	User reviewer= reviewService.findOneUser(review.getUser().getId());
    	model.addAttribute("current", review);
    	model.addAttribute("date", formatter.format(date));
    	model.addAttribute("reviewer", reviewer);
    	int likes = review.getLikes().size();
    	int dislikes = review.getDislikes().size();
    	model.addAttribute("likes", likes);
    	model.addAttribute("dislikes", dislikes);
    	session.setAttribute("review_id", review.getId());
    	System.out.print(likes);

    	return "reading.jsp";
    }
    //GENRE CONTROLS - Not currently part of the app, but maybe later?
    @GetMapping("/newGenre")
    public String newGenre(HttpSession session, Model model) {
    	model.addAttribute("allGenres", reviewService.allGenres());
    	model.addAttribute("genre", new Genre());
    	return "newGenre.jsp";
    }
    @PostMapping("/createGenre")
     public String createGenre(@Valid @ModelAttribute("genre") Genre genre, BindingResult result) {
    	if(result.hasErrors()) {
    		return "newGenre.jsp";
    	} else {
    		reviewService.createGenre(genre);
    		return "redirect:/newGenre";
    	}
    }
    @RequestMapping(value="/delete/genre/{id}")
    public String deleteGenre(@PathVariable("id") Long id, Model model) {
    	reviewService.deleteGenre(id);
    	return "redirect:/newGenre";
    }
    //MEDIA CONTROLS - add and remove media types to attach to reviews like movies, books, etc
    @GetMapping("/newMedia")
    public String newMedia(HttpSession session, Model model) {
    	model.addAttribute("allMedia", reviewService.allMedia());
    	model.addAttribute("media", new Media());
    	return "newMedia.jsp";
    }
    @PostMapping("/createMedia")
    public String createMedia(@Valid @ModelAttribute("media") Media media, BindingResult result) {
    	if(result.hasErrors()) {
    		return "newMedia.jsp";
    	} else {
    		reviewService.createMedia(media);
    		return "redirect:/newMedia";
    	}
    }

    @RequestMapping(value="/delete/media/{id}")
    public String deleteMedia(@PathVariable("id") Long id, Model model) {
    	reviewService.deleteMedia(id);
    	return "redirect:/newMedia";
    }

    //Your Reviews Page

    @GetMapping("/yourReviews")
    public String yourReviews(HttpSession session, Model model) {
    	User user = reviewService.findOneUser((Long) session.getAttribute("user_id"));
    	model.addAttribute("user", user);
    	return "yourReviews.jsp";
    }



    @PostMapping("/search/")
    public String search(@Valid @ModelAttribute("data") Data data, BindingResult result, Model model) {
    			model.addAttribute("data", new Data());
    			System.out.println("YOU SEARCHED FOR " + data.getStatus());
    			String searchTerm = data.getStatus().replace(' ', '-');

	    	    	if(result.hasErrors()) {
	    	    		return "redirect:/home";
	    	    	} else {
			        	HttpRequest request = HttpRequest.newBuilder()
			        			.uri(URI.create("https://imdb-api.com/en/API/SearchMovie/k_80srbr36/" + searchTerm ))
			        			.method("GET", HttpRequest.BodyPublishers.noBody())
			        			.build();
			        	HttpResponse<String> response;
			    		try {
			    			response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			    		

			    			//Parse

//    			System.out.println( "WHAT COMES OUT OF  PARSE ------------------" + parseMovieList(response.body()));
	    			JSONArray movieArray = parseMovieList(response.body());
	    			System.out.println("MOVIES" + movieArray);

		    			ArrayList<Movie_Result> movies = new ArrayList<>();
		    			//iterates through the data and creates instance of result
		    			for (int i=0; i<movieArray.length();i++) {
		    			JSONObject movieResult = movieArray.getJSONObject(i);
			    			String title = movieResult.get("title").toString();
			 			String description = movieResult.get("description").toString();
			 			String id = movieResult.get("id").toString();
			 			String image = movieResult.get("image").toString();
			 			System.out.println(image);
			 			String resultType = movieResult.get("resultType").toString();
			 			Movie_Result aMovie = new Movie_Result(id, resultType, image, title, description);
	    				movies.add(aMovie);
	    			}
		    			System.out.println("MOVIE ARRAY FROM MOVIELIST" + movies);
		    			model.addAttribute("result", movies);
		    			

			    		} catch (IOException e) {
			    			// TODO Auto-generated catch block
			    			e.printStackTrace();
			    		} catch (InterruptedException e) {
			    			// TODO Auto-generated catch block
			    			e.printStackTrace();
			    		}
			    	}
	    	    	model.addAttribute("Movie_Result", new Movie_Result());
    	    	return "results.jsp";
    }

    // Parsing response from IMDB api
    public static JSONArray parseMovieList(String responseBody) {
    		JSONObject jsonobject = new JSONObject(responseBody);
    		JSONArray jsonArray = jsonobject.getJSONArray("results");
    	
			return jsonArray;
    }

    public static Movie_Result parseMovieDetails(String responseBody) {
    	System.out.println("making it to detail parser");
    	JSONArray movieArray = parseMovieList(responseBody);
    	System.out.println("MOVIEARRAY ----" + movieArray.get(0));
		JSONObject jsonobject = new JSONObject(responseBody);
		System.out.println("BODY? ++++++++" + jsonobject);
		System.out.println("TITLE? ++++++++" + jsonobject.get("results"));
		ArrayList<Object> results = new ArrayList<Object>();
	
		System.out.println("RESULTS ----" + results);
		
		String title = jsonobject.get("l").toString();
		String description = jsonobject.get("description").toString();
		String resultType = jsonobject.get("year").toString();
		System.out.println("jsonArray check ___________________" + title + description);
		Movie_Result aMovie = new Movie_Result(null, resultType, null, title, description);
		return aMovie;
}

    public static Movie_Result parseImage(String responseBody) {
		JSONObject jsonobject = new JSONObject(responseBody);
		String image = jsonobject.get("poster").toString();
		System.out.println("STRING OF IMAGE CHECK  ___________________" + image);
		Movie_Result imagePoster = new Movie_Result(null, null, image, null, null);
		return imagePoster;
}

    //Likes and Dislikes

    @RequestMapping(value="/like/review/{id}")
    public  String like(@PathVariable("id") Long id, HttpSession session, Model model) {
    	User user = reviewService.findOneUser((Long) session.getAttribute("user_id"));
    	Review review = reviewService.getOneReview(id);
    	System.out.println(user.getUserName() + user.getId());
    	System.out.println(review.getTitle() + review.getId());
    	user.getLikes().add(review);
    	reviewService.saveUser(user);


    	return "redirect:/reading/" + session.getAttribute("review_id");
    }

    @RequestMapping(value="/dislike/review/{id}")
    public  String dislike(@PathVariable("id") Long id, HttpSession session, Model model) {
    		System.out.println(id);
    	User user = reviewService.findOneUser((Long) session.getAttribute("user_id"));
    		System.out.println(user);
    	Review review = reviewService.getOneReview(id);
    		System.out.println(review);
    	user.getDislikes().add(review);
    	reviewService.saveUser(user);
    	return "redirect:/reading/" + session.getAttribute("review_id");
    }

    //ACCOUNT SETTINGS
    @GetMapping("/accountSettings")
    public String account(@ModelAttribute User user, HttpSession session, Model model) {
    	model.addAttribute("user", reviewService.findOneUser((Long) session.getAttribute("user_id")));
    	return "account.jsp";
    }

    @RequestMapping(value="/accountSettings/update/{id}", method=RequestMethod.POST)
    public String updateAccount(@Valid @PathVariable("id") Long id, @ModelAttribute("user") User user, BindingResult result) {
    	User oldUser = reviewService.findOneUser(id);
    	user.setReviews(oldUser.getReviews());
    	user.setLikes(oldUser.getLikes());
    	user.setDislikes(oldUser.getDislikes());
    	user.setPassword(oldUser.getPassword());

    	if(result.hasErrors()) {

    		System.out.println("SOMETHING WENT WRONG" + result.getAllErrors());

    		return "account.jsp";
    	} else {
    		System.out.println("SUCCESS");
    		reviewService.updateUser(user, user.getUserName(), user.getBio(), user.getEmail());
    		return "redirect:/home";
    	}
    }

    @GetMapping("/delete/confirm")
    public String confirm(HttpSession session, Model model) {
    	return "confirm.jsp";
    }

    @GetMapping("/deleteUser")
    public String deleteUser(HttpSession session) {
    	return "redirect:/";
    }


}
