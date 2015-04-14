package demo;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface ArticleRepository extends MongoRepository<Article, String>{

    public Article findByAuthor(String author);

}
