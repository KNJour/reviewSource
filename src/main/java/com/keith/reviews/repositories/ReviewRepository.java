package com.keith.reviews.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.keith.reviews.models.Review;
@Repository
public interface ReviewRepository extends JpaRepository <Review, Long>{

	Optional<Review> findById(Long id);
	Review findTopByOrderByIdDesc();
	
	long count();
	Page<Review> findAll(Pageable pageable);
	
	public List<Review> findTop50ByOrderByCreatedAtDesc();
	
	public List<Review> findTop50ByOrderByLikesDesc();
	}
	


