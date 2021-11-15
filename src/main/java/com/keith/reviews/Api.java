package com.keith.reviews;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;

public class Api {
	private static HttpURLConnection connection;
		public static void main(String[] args) {
		//defining reader
			
			BufferedReader reader;
			String line;
			StringBuffer responseContent = new StringBuffer();
			try {
					URL url = new URL("https://api.themoviedb.org/3/movie/550?api_key=19011a9abd3cbc1c18f64f1e5a0c350b");
					connection = (HttpURLConnection) url.openConnection();
					
					//setup
					connection.setRequestMethod("GET");
					connection.setConnectTimeout(5000);
					connection.setReadTimeout(5000);
					
					//getting server response
					
					int status = connection.getResponseCode();
					System.out.println(status);
					
					if (status > 299) {
						reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
						while((line = reader.readLine()) != null) {
							responseContent.append(line);
						}
					} else {
						reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
						while((line = reader.readLine()) != null) {
							responseContent.append(line);
						}
					}
//					parse(responseContent.toString());
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				connection.disconnect();
			}
		
	}
//		public static String parse(String responseBody) {
//			JSONArray albums = new JSONArray(responseBody);
//				for (int i = 0; i < albums.length(); i++) {
//					JSONObject album = albums.getJSONObject(i);
//					int id = album.getInt("id");
//					int userId = album.getInt("userId");
//					String title = album.getString("title");
//					System.out.println(id + " " + title + " " + userId);
//				
//			}
//			return null;
//		}
}
