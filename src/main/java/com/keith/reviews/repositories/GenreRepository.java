package com.keith.reviews.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.keith.reviews.models.Genre;
@Repository
public interface GenreRepository extends CrudRepository<Genre, Long>{

	Optional<Genre> findById(Long id);

}
