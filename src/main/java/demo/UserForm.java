package demo;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class UserForm {

    @NotNull
    @NotEmpty
    @Size(min = 2, max = 14)
    public String username;
}
