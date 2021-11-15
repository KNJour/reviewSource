package com.keith.reviews.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.keith.reviews.models.Review;
@Repository
public interface ReviewRepository extends CrudRepository<Review, Long>{

	Optional<Review> findById(Long id);

}
