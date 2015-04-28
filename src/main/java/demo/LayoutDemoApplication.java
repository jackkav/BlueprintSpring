package demo;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import org.jongo.Jongo;
import org.jongo.MongoCollection;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import java.net.UnknownHostException;
import java.util.Locale;

@SpringBootApplication
public class LayoutDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(LayoutDemoApplication.class, args);
    }
    @Bean
    public Jongo jongo() {
        DB db;
        try {
            db = new MongoClient("127.0.0.1", 27017).getDB("demo");
        } catch (UnknownHostException e) {
            throw new MongoException("Connection error : ", e);
        }
        return new Jongo(db);
    }

    @Bean
    public MongoCollection users() {
        return jongo().getCollection("users");
    }


}