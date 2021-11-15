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
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
    
@Entity
@Table(name="users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message="Username is required!")
    @Size(min=3, max=30, message="Username must be between 3 and 30 characters")
    private String userName;
    
    @NotEmpty(message="Email is required!")
    @Email(message="Please enter a valid email!")
    private String email;
    
    @NotEmpty(message="Password is required!")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;
    
    private String bio;
    
    public List<Review> getReviews() {
		return reviews;
	}
	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	@Transient
    @NotEmpty(message="Confirm Password is required!")
    @Size(min=8, max=128, message="Confirm Password must be between 8 and 128 characters")
    private String confirm;
  
    @OneToMany(mappedBy="user", fetch=FetchType.LAZY)
    private List<Review>reviews;
    
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
			name= "user_likes",
			joinColumns = @JoinColumn(name = "user_id"),
			inverseJoinColumns = @JoinColumn(name = "review_id")
			)
	private List<Review>likes;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name= "user_dislikes",
			joinColumns = @JoinColumn(name = "user_id"),
			inverseJoinColumns = @JoinColumn(name = "review_id")
			)
	private List<Review>dislikes;

    public User() {}

	public User(Long id,
			@NotEmpty(message = "Username is required!") @Size(min = 3, max = 30, message = "Username must be between 3 and 30 characters") String userName,
			@NotEmpty(message = "Email is required!") @Email(message = "Please enter a valid email!") String email,
			@NotEmpty(message = "Password is required!") @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters") String password,
			String bio,
			@NotEmpty(message = "Confirm Password is required!") @Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters") String confirm,
			List<Review> reviews, Date createdAt, Date updatedAt, List<Review> likes, List<Review> dislikes) {
		super();
		this.id = id;
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.bio = bio;
		this.confirm = confirm;
		this.reviews = reviews;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.likes = likes;
		this.dislikes = dislikes;
	}
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
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
	public List<Review> getLikes() {
		return likes;
	}
	public void setLikes(List<Review> likes) {
		this.likes = likes;
	}
	public List<Review> getDislikes() {
		return dislikes;
	}
	public void setDislikes(List<Review> dislikes) {
		this.dislikes = dislikes;
	}
	
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
    

}
    