package demo;

import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface ArticleRepository extends MongoRepository<Article, String>{

    public Article findByAuthor(String author);

    public List<Article> findByTitle(String title);

}
