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

            <!-- Step indicator -->
            <div class="step-indicator">
                <div class="step active" id="step-dot-1">1</div>
                <div class="step-line"></div>
                <div class="step" id="step-dot-2">2</div>
            </div>

            <form id="registerForm" action="Register" method="POST" class="w3-container w3-padding-24">

                <!-- Step 1: Account Information -->
                <div id="step1">
                    <h4 class="w3-text-teal section-title">Account Information</h4>

                    <p>
                        <label class="w3-text-grey">Username</label>
                        <input class="w3-input w3-border" type="text" id="username" name="username" required
                            minlength="5" maxlength="20" value="${user.username}" placeholder="Enter your username (5-20 characters)"
                            title="Username must be between 5 and 20 characters." />
                    </p>

                    <p>
                        <label class="w3-text-grey">Password</label>
                        <input class="w3-input w3-border" type="password" id="password" name="password" required
                            pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$" value="${user.password}"
                            placeholder="Min. 8 chars: uppercase, number, special char (@#$%^&*)"
                            title="Minimum 8 characters, including uppercase, number, and special character (@#$%^&*)." autocomplete="off" />
                    </p>

                    <p>
                        <label class="w3-text-grey">Confirm Password</label>
                        <input class="w3-input w3-border" type="password" id="confirmPassword"
                            name="confirmPassword" required value="${user.password}"
                            placeholder="Confirm your password" title="Passwords must match." autocomplete="off" />
                    </p>

                    <button type="button" id="nextBtn" class="w3-button w3-teal w3-block w3-section w3-padding register-btn">Next &rarr;</button>
                </div>

                <!-- Step 2: Personal Information -->
                <div id="step2" style="display:none">
                    <h4 class="w3-text-teal section-title">Personal Information</h4>

                    <p>
                        <label class="w3-text-grey">First Name</label>
                        <input class="w3-input w3-border" type="text" id="firstName" name="firstName" required
                            minlength="2" maxlength="50" value="${user.firstName}" placeholder="Enter your first name"
                            title="First name must be between 2 and 50 characters." />
                    </p>

                    <p>
                        <label class="w3-text-grey">Last Name</label>
                        <input class="w3-input w3-border" type="text" id="lastName" name="lastName" required
                            minlength="2" maxlength="50" value="${user.lastName}" placeholder="Enter your last name"
                            title="Last name must be between 2 and 50 characters." />
                    </p>

                    <p>
                        <label class="w3-text-grey">Email</label>
                        <input class="w3-input w3-border" type="email" id="email" name="email" required
                            value="${user.email}" placeholder="Enter your email address"
                            title="Please enter a valid email address." />
                    </p>

                    <p>
                        <label class="w3-text-grey">Phone</label>
                        <input class="w3-input w3-border" type="tel" id="phone" name="phone" required
                            value="${user.phone}" placeholder="e.g. +34612345678"
                            title="Please enter a valid international phone number." />
                    </p>

                    <p>
                        <label class="w3-text-grey">Date of Birth</label>
                        <input class="w3-input w3-border" type="date" id="dateOfBirth" name="dateOfBirth" required
                            value="${user.dateOfBirth}" title="You must be at least 16 years old to register." />
                    </p>

                    <p>
                        <label class="w3-text-grey">Allergies <span class="optional-label">(optional)</span></label>
                        <input class="w3-input w3-border" type="text" id="allergies" name="allergies"
                            maxlength="200" value="${user.allergies}" placeholder="e.g. nuts, gluten, dairy"
                            title="Maximum 200 characters." />
                    </p>

                    <div style="display:flex; gap:10px;">
                        <button type="button" id="backBtn" class="w3-button w3-grey w3-section w3-padding back-btn">&larr; Back</button>
                        <button type="submit" class="w3-button w3-teal w3-section w3-padding register-btn" style="flex:1">Register</button>
                    </div>
                </div>

            </form>
        </div>
    </div>

    <script>
        // Set max date for dateOfBirth (user must be at least 16 years old)
        const dobInput = document.getElementById('dateOfBirth');
        const maxDate = new Date();
        maxDate.setFullYear(maxDate.getFullYear() - 16);
        dobInput.max = maxDate.toISOString().split('T')[0];

        // Multi-step navigation
        const step1 = document.getElementById('step1');
        const step2 = document.getElementById('step2');
        const nextBtn = document.getElementById('nextBtn');
        const backBtn = document.getElementById('backBtn');
        const dot1 = document.getElementById('step-dot-1');
        const dot2 = document.getElementById('step-dot-2');

        // Always start at step1 unless server errors require step2
        step1.style.display = 'block';
        step2.style.display = 'none';
        nextBtn.addEventListener('click', () => {
            // Validate only step 1 fields before proceeding
            const step1Inputs = step1.querySelectorAll('input');
            let valid = true;
            step1Inputs.forEach(input => {
                if (!input.checkValidity()) {
                    input.reportValidity();
                    valid = false;
                }
            });
            if (!valid) return;
            step1.style.display = 'none';
            step2.style.display = 'block';
            dot1.classList.remove('active');
            dot1.classList.add('done');
            dot2.classList.add('active');
        });

        backBtn.addEventListener('click', () => {
            step2.style.display = 'none';
            step1.style.display = 'block';
            dot2.classList.remove('active');
            dot1.classList.remove('done');
            dot1.classList.add('active');
        });

        // If server returned errors on step2 fields, go straight to step2
        const step2Fields = ['firstName', 'lastName', 'email', 'phone', 'dateOfBirth', 'allergies'];

        // Injectem els errors del servidor (Format Map K/V) per al JS
        const serverErrors = {
            <c:forEach var="error" items="${errors}">
                "${error.key}": "${error.value}",
            </c:forEach>
        };

        const hasStep2Error = step2Fields.some(f => serverErrors[f]);
        if (hasStep2Error) {
            step1.style.display = 'none';
            step2.style.display = 'block';
            dot1.classList.remove('active');
            dot1.classList.add('done');
            dot2.classList.add('active');
        }
    </script>
    <script src="js/validation.js"></script>

</body>

</html>