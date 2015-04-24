package demo;

import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface ArticleRepository extends MongoRepository<Article, String>{

    Article findByAuthor(String author);

    List<Article> findByTitleLike(String title);

}
