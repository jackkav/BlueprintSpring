package demo;

import org.springframework.data.mongodb.repository.MongoRepository;

/**
 * Created by Jack Kavanagh on 16/04/2015.
 */
public interface JournalRepository extends MongoRepository<Journal, String> {

    Journal findByTitle(String title);

}