package com.keith.reviews;

import java.net.HttpURLConnection;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.json.JSONArray;
import org.json.JSONObject;



public class Api2 {
	private static HttpURLConnection connection;
	public static void main(String[] args) {
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder().uri(URI.create("https://jsonPlaceholder.typicode.com/albums")).build();
		client.sendAsync(request, HttpResponse.BodyHandlers.ofString()).
		thenApply(HttpResponse::body)
//		.thenApply(Main::parse)
		.join();
		
	}
	
	public static String parse(String responseBody) {
		JSONArray albums = new JSONArray(responseBody);
			for (int i = 0; i < albums.length(); i++) {
				JSONObject album = albums.getJSONObject(i);
				int id = album.getInt("id");
				int userId = album.getInt("userId");
				String title = album.getString("title");
				System.out.println(id + " " + title + " " + userId);
			
		}
		return null;
	}
}
