package com.keith.reviews.models;

import java.util.List;

public class Data {
private List<Movie_Result> movie_results;
private int search_results;
private String status;
private String status_message;

public Data() {}

public Data(List<Movie_Result> movie_results, int search_results, String status, String status_message) {
	super();
	this.movie_results = movie_results;
	this.search_results = search_results;
	this.status = status;
	this.status_message = status_message;
}

public List<Movie_Result> getMovie_results() {
	return movie_results;
}

public void setMovie_results(List<Movie_Result> movie_results) {
	this.movie_results = movie_results;
}

public int getSearch_results() {
	return search_results;
}

public void setSearch_results(int search_results) {
	this.search_results = search_results;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public String getStatus_message() {
	return status_message;
}

public void setStatus_message(String status_message) {
	this.status_message = status_message;
}



}


