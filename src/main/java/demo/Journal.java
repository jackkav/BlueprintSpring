package demo;

import org.springframework.data.annotation.Id;

import java.util.List;

/**
 * Created by Jack Kavanagh on 16/04/2015.
 */
public class Journal {
    @Id
    private String id;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String title;

    public List<String> getBooks() {
        return books;
    }

    public void setBooks(List<String> books) {
        this.books = books;
    }

    public List<String> books;
}
