package com.keith.reviews.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="reviews")
public class Review {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@NotNull(message="what you're reviewing is required!")
	@Size(min=1, max=100, message="review must be between 1 and 100 characters")
	private String what;

	@NotNull(message="Review title is required!")
	@Size(min=1, max=100, message="review must be between 1 and 100 characters")
	private String title;

	@Size(max=3000, message="review description  can not be more than 3000 characters")
	@Column(length = 1000)
	private String description;

	@NotNull(message="Review content is required!")
	@Size(min=5, max=3000, message="review must be between 5 and 3000 characters")
	private String content;

	@NotNull(message="Rating is required")
	private double rating;
	@Column(length = 1000)
	private String image;

	   @Column(updatable=false)
	    @DateTimeFormat(pattern="yyyy-MM-dd")
		private Date createdAt;
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date updatedAt;

		@PrePersist
		protected void onCreate(){
		    this.createdAt = new Date();
		}
		@PreUpdate
		protected void onUpdate(){
		    this.updatedAt = new Date();
		}

		@ManyToOne(fetch=FetchType.LAZY)
		@JoinColumn(name="user_id")
		private User user;

		@ManyToOne(fetch=FetchType.LAZY)
		@JoinColumn(name="media_id")
		private Media media;

		@ManyToMany(fetch=FetchType.LAZY)
		@JoinTable(
				name= "review_genre",
				joinColumns = @JoinColumn(name = "review_id"),
				inverseJoinColumns = @JoinColumn(name = "genre_id")
				)
		private List<Genre>genre;

		@ManyToMany(fetch=FetchType.LAZY)
		@JoinTable(
				name = "user_likes",
				joinColumns = @JoinColumn(name = "review_id"),
				inverseJoinColumns = @JoinColumn(name = "user_id")
				)
		private List<User>likes;

		@ManyToMany(fetch=FetchType.LAZY)
		@JoinTable(
				name = "user_dislikes",
				joinColumns = @JoinColumn(name = "review_id"),
				inverseJoinColumns = @JoinColumn(name = "user_id")
				)
		private List<User>dislikes;

		public Review() {}


		public Review(Long id,
				@NotNull(message = "what you're reviewing is required!") @Size(min = 1, max = 100, message = "review must be between 1 and 100 characters") String what,
				@NotNull(message = "Review title is required!") @Size(min = 1, max = 100, message = "review must be between 1 and 100 characters") String title,
				@NotNull(message = "Review content is required!") @Size(min = 5, max = 3000, message = "review must be between 5 and 3000 characters") String content,
				@NotNull(message = "Rating is required") double rating, String description,  String image, User user, Media media,
				List<Genre> genre, List<User> likes, List<User> dislikes) {
			super();
			this.id = id;
			this.what = what;
			this.title = title;
			this.description = description;
			this.content = content;
			this.rating = rating;
			this.image = image;
			this.user = user;
			this.media = media;
			this.genre = genre;
			this.likes = likes;
			this.dislikes = dislikes;
		}
		public void setMedia(Media media) {
			this.media = media;
		}
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public double getRating() {
			return rating;
		}
		public void setRating(double rating) {
			this.rating = rating;
		}
		public Date getCreatedAt() {
			return createdAt;
		}
		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}
		public Date getUpdatedAt() {
			return updatedAt;
		}
		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}
		public User getUser() {
			return user;
		}
		public void setUser(User user) {
			this.user = user;
		}
		public List<Genre> getGenre() {
			return genre;
		}
		public void setGenre(List<Genre> genre) {
			this.genre = genre;
		}
		public Media getMedia() {
			return media;
		}
		public String getWhat() {
			return what;
		}
		public void setWhat(String what) {
			this.what = what;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		public List<User> getLikes() {
			return likes;
		}
		public void setLikes(List<User> likes) {
			this.likes = likes;
		}
		public List<User> getDislikes() {
			return dislikes;
		}
		public void setDislikes(List<User> dislikes) {
			this.dislikes = dislikes;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}





}
