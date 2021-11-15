package com.keith.reviews;
import java.net.URLEncoder;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;

public class ApiQuery {

	public static void main( String[] args ) throws Exception {
		String host = "https://movie-database-imdb-alternative.p.rapidapi.com/";
		String charset = "UTF-8";
		String apiHost = "movies-tvshows-data-imdb.p.rapidapi.com";
		String  apiKey = "350547b6cbmsha67e51b9f91f36ep11e770jsn17990603a3bd";
		
		//Paramaters
		String s = "Pulp";
		
		String query = String.format("s=%s", URLEncoder.encode(s, charset));
		
		HttpResponse <JsonNode> response = Unirest.get("https://movies-tvshows-data-imdb.p.rapidapi.com/?type=get-movies-by-title&title=" + s)
			      .header("x-rapidapi-host", apiHost)
			      .header("x-rapidapi-key", apiKey)
			      .asJson();
			    System.out.println("STATUS +++++++++++++++++" + response.getStatus());
			      System.out.println("HEADERS _______________" + response.getHeaders().get("Content-Type"));
			      
			      
	}

}
