<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="css/style.css">
    <title>User Registration</title>
</head>

<body>

    <div class="main-container">
        <div class="w3-card-4 w3-white">
            <div class="w3-container w3-teal">
                <h2>Join Our Food Community!</h2>
            </div>

            <form id="registerForm" action="Register" method="POST" class="w3-container w3-padding-24">

                <h4 class="w3-text-teal section-title">Account Information</h4>
                <p>
                    <label class="w3-text-grey">Username</label>
                    <input class="w3-input w3-border" type="text" id="name" name="name" required minlength="5"
                        value="${user.name}" placeholder="Enter your username (5-20 characters)" title="Username must be between 5 and 20 characters." />
                </p>

                <p>
                    <label class="w3-text-grey">Password</label>
                    <input class="w3-input w3-border" type="password" id="password" name="password" required
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$" value="${user.password}"
                        placeholder="Min. 8 chars: uppercase, number, special char (@#$%^&*)" title="Minimum 8 characters, including uppercase, number, and special character (@#$%^&*)." />
                </p>

                <p>
                    <label class="w3-text-grey">Confirm Password</label>
                    <input class="w3-input w3-border" type="password" id="confirmPassword"
                        name="confirmPassword" required value="${user.password}"
                        placeholder="Confirm your password" title="Passwords must match." />
                </p>

                <button type="submit" class="w3-button w3-teal w3-block w3-section w3-padding register-btn">Register</button>

            </form>
        </div>
    </div>

    <script>
        // Injectem els errors del servidor (Format Map K/V) per al JS
        const serverErrors = {
            <c:forEach var="error" items="${errors}">
                "${error.key}": "${error.value}",
            </c:forEach>
        };
    </script>
    <script src="js/validation.js"></script>

</body>

</html>