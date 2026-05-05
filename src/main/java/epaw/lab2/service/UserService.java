package epaw.lab2.service;

import java.util.HashMap;
import java.util.Map;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeParseException;


import epaw.lab2.model.User;
import epaw.lab2.repository.UserRepository;
import jakarta.ejb.Local;

public class UserService {
	
	private static UserService instance;
	private UserRepository userRepository;
	
	private UserService() {
        this.userRepository = UserRepository.getInstance();
    }
	
	public static synchronized UserService getInstance() {
		if (instance == null) {
			instance = new UserService();
		}
		return instance;
	}
	
	private static final String PASSWORD_REGEX = 
	        "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,}$";


    //afegir validacions per email, phone
	
    public Map<String, String> validate(User user) {
        Map<String, String> errors = new HashMap<>();
        
        String firstName = user.getFirstName();
        if (firstName == null || firstName.trim().isEmpty()) {
            errors.put("firstName", "First name cannot be empty.");
        }
        else if (firstName.length() < 2 || firstName.length() > 50) {
            errors.put("firstName", "First name must be between 2 and 50 characters.");
        }

        String lastName = user.getLastName();
        if (lastName == null || lastName.trim().isEmpty()) {
            errors.put("lastName", "Last name cannot be empty.");
        }else if (lastName.length() < 2 || lastName.length() > 50) {
            errors.put("lastName", "Last name must be between 2 and 50 characters.");
        }

  
        String name = user.getName();
        if (name == null || name.trim().isEmpty()) {
            errors.put("name", "Username cannot be empty.");
        } else if (name.length() < 5 || name.length() > 20) {
            errors.put("name", "Username must be between 5 and 20 characters.");
        } else if (userRepository.existsByUsername(name)) {
            errors.put("name", "Username already exists.");
        }

        String password = user.getPassword();
        if (password == null || !password.matches(PASSWORD_REGEX)) {
            errors.put("password", "Password must be 8+ chars, upper, lower, number and symbol.");
        }

        String email = user.getEmail();
        if (email == null || email.trim().isEmpty()) {
            errors.put("email", "Email cannot be empty.");
        } else if (userRepository.existsByEmail(email)) {
            errors.put("email", "Email already exists.");
        } 
        //check format email

        String phone = user.getPhone();
        if (phone == null || phone.trim().isEmpty()) {
            errors.put("phone", "Phone cannot be empty.");
        } //check format phone

        String dateOfBirth = user.getDateOfBirth();
        if (dateOfBirth == null || dateOfBirth.trim().isEmpty()) {
            errors.put("dateOfBirth", "Date of birth cannot be empty.");
        } else{
            try{
                LocalDate dob = LocalDate.parse(dateOfBirth);
                int age= Period.between(dob, LocalDate.now()).getYears();
                if(age < 16){
                    errors.put("dateOfBirth", "User must be at least 16 years old.");
                }
            } catch (DateTimeParseException e) {
                errors.put("dateOfBirth", "Invalid date format. Please use YYYY-MM-DD.");
            }
        }

        //hem de posar lo de les preferències alimentàries, al·lèrgies, gènere i títol? parlar-ho
        return errors;
    }

    public Map<String, String> register(User user) {
        Map<String, String> errors = validate(user);
        if (errors.isEmpty()) {
            userRepository.save(user);
        }
        return errors;
    }

}