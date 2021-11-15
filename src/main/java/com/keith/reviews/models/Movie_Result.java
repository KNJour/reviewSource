package com.keith.reviews.models;

public class Movie_Result {

	private String id;
	private String resultType;
	private String image;
	private String title;
	private String description;
	
	public Movie_Result() {}
	public Movie_Result(String id, String resultType, String image, String title, String description) {
		super();
		this.id = id;
		this.resultType = resultType;
		this.image = image;
		this.title = title;
		this.description = description;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getResultType() {
		return resultType;
	}
	public void setResultType(String resultType) {
		this.resultType = resultType;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	



}
