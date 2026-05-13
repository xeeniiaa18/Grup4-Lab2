<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=DM+Sans:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <title>Welcome to the Community!</title>
    
</head>
<body class="success-page">

    <div class="floaters">
        <span class="floater">🍳</span>
        <span class="floater">🥗</span>
        <span class="floater">🍜</span>
        <span class="floater">🧁</span>
        <span class="floater">🫐</span>
        <span class="floater">🥕</span>
        <span class="floater">🍋</span>
        <span class="floater">🫒</span>
    </div>

    <div class="card">
        <div class="card-stripe"></div>

        <div class="icon-wrap">
            <div class="icon-circle">✓</div>
        </div>

        <div class="card-body">
            <h1>Welcome to<br>the Community!</h1>

            <div class="username-badge">@${user.username}</div>

            <p>Your account has been created successfully.<br>
               You're now part of a growing community of food lovers, home cooks, and culinary adventurers.</p>

            <div class="divider"><span>🍴</span></div>

            <a href="Login" class="btn-login">Sign in to get started →</a>
        </div>

        <div class="card-footer">
            Share recipes · Discover flavours · Connect with cooks
        </div>
    </div>

</body>
</html>
