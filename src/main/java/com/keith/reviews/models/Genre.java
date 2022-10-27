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
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="genres")
public class Genre {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@NotNull
	private String name;

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

		@ManyToMany(fetch=FetchType.LAZY)
		@JoinTable(
				name = "review_genre",
				joinColumns = @JoinColumn(name = "genre_id"),
				inverseJoinColumns = @JoinColumn(name = "review_id")
				)
		private List<Review>reviews;

		@ManyToMany(fetch=FetchType.LAZY)
		@JoinTable(
				name = "media_genre",
				joinColumns = @JoinColumn(name = "genre_id"),
				inverseJoinColumns = @JoinColumn(name = "media_id")
				)
		private List<Media>medias;

		public Genre() {}
		public Genre(Long id, @NotNull String name, List<Review> reviews, List<Media> medias) {
			super();
			this.id = id;
			this.name = name;
			this.reviews = reviews;
			this.medias = medias;
		}
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
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
		public List<Review> getReviews() {
			return reviews;
		}
		public void setReviews(List<Review> reviews) {
			this.reviews = reviews;
		}
		public List<Media> getMedias() {
			return medias;
		}
		public void setMedias(List<Media> medias) {
			this.medias = medias;
		}


}
