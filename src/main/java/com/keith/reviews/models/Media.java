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

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="media")
public class Media {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	private String type;
	
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
		
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name="review_id")
		private Review review;
		
		@ManyToMany(fetch=FetchType.LAZY)
		@JoinTable(
				name = "media_genre",
				joinColumns = @JoinColumn(name = "media_id"),
				inverseJoinColumns = @JoinColumn(name = "genre_id")
				)
		private List<Genre>genres;

		public Media() {}
		
		public Media(Long id, @NotNull String type, Review review, List<Genre> genres) {
			super();
			this.id = id;
			this.type = type;
			this.review = review;
			this.genres = genres;
		}
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
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
		public Review getReview() {
			return review;
		}
		public void setReview(Review review) {
			this.review = review;
		}
		public List<Genre> getGenres() {
			return genres;
		}
		public void setGenres(List<Genre> genres) {
			this.genres = genres;
		}
	
		
}
