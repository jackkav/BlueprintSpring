package demo;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Size;

public class UserForm {

    @Size(min = 5, max = 14)
    public String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}
