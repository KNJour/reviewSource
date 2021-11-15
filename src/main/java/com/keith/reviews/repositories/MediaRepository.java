package com.keith.reviews.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.keith.reviews.models.Media;
@Repository
public interface MediaRepository extends CrudRepository<Media, Long> {

	Optional<Media> findById(Long id);

}
