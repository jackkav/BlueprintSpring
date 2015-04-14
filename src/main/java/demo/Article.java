package demo;

import org.springframework.data.annotation.Id;

public class Article {

    @Id
    private String id;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String title;

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String author;

    public Article() {}

    public Article(String title, String author) {
        this.title = title;
        this.author = author;
    }

    @Override
    public String toString() {
        return String.format(
                "Customer[id=%s, title='%s', author='%s']",
                id, title, author);
    }
}
