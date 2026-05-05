<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=DM+Sans:wght@400;500&display=swap" rel="stylesheet">
    <title>Welcome to the Community!</title>
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --cream: #fdf6ec;
            --warm-brown: #5c3d2e;
            --orange: #e07b39;
            --orange-light: #f4a45a;
            --green: #3d7a5a;
            --green-light: #c8e6d5;
            --text: #2d1f17;
            --muted: #8a7060;
        }

        body {
            min-height: 100vh;
            background-color: var(--cream);
            background-image:
                radial-gradient(ellipse at 10% 20%, rgba(224, 123, 57, 0.12) 0%, transparent 50%),
                radial-gradient(ellipse at 90% 80%, rgba(61, 122, 90, 0.10) 0%, transparent 50%);
            font-family: 'DM Sans', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }

        /* Floating food emojis background */
        .floaters {
            position: fixed;
            inset: 0;
            pointer-events: none;
            overflow: hidden;
            z-index: 0;
        }
        .floater {
            position: absolute;
            font-size: 28px;
            opacity: 0.13;
            animation: drift linear infinite;
        }
        .floater:nth-child(1)  { left: 5%;  top: 10%; animation-duration: 18s; animation-delay: 0s;   font-size: 22px; }
        .floater:nth-child(2)  { left: 88%; top: 5%;  animation-duration: 22s; animation-delay: -4s;  font-size: 32px; }
        .floater:nth-child(3)  { left: 20%; top: 80%; animation-duration: 20s; animation-delay: -8s;  font-size: 26px; }
        .floater:nth-child(4)  { left: 70%; top: 70%; animation-duration: 16s; animation-delay: -2s;  font-size: 30px; }
        .floater:nth-child(5)  { left: 45%; top: 90%; animation-duration: 25s; animation-delay: -6s;  font-size: 24px; }
        .floater:nth-child(6)  { left: 92%; top: 45%; animation-duration: 19s; animation-delay: -10s; font-size: 20px; }
        .floater:nth-child(7)  { left: 3%;  top: 60%; animation-duration: 23s; animation-delay: -3s;  font-size: 28px; }
        .floater:nth-child(8)  { left: 60%; top: 3%;  animation-duration: 17s; animation-delay: -7s;  font-size: 34px; }

        @keyframes drift {
            0%   { transform: translateY(0px) rotate(0deg); }
            50%  { transform: translateY(-30px) rotate(8deg); }
            100% { transform: translateY(0px) rotate(0deg); }
        }

        /* Main card */
        .card {
            position: relative;
            z-index: 1;
            background: white;
            border-radius: 28px;
            max-width: 460px;
            width: 100%;
            box-shadow:
                0 2px 0 rgba(224,123,57,0.3),
                0 8px 40px rgba(92,61,46,0.12),
                0 40px 80px rgba(92,61,46,0.06);
            overflow: hidden;
            animation: slideUp 0.6s cubic-bezier(0.34, 1.56, 0.64, 1) both;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(40px) scale(0.96); }
            to   { opacity: 1; transform: translateY(0)    scale(1); }
        }

        /* Top accent strip */
        .card-stripe {
            height: 6px;
            background: linear-gradient(90deg, var(--orange), var(--orange-light), var(--green));
        }

        /* Success icon */
        .icon-wrap {
            display: flex;
            justify-content: center;
            padding: 36px 0 8px;
        }

        .icon-circle {
            width: 84px;
            height: 84px;
            background: var(--green-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
            animation: popIn 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) 0.3s both;
            box-shadow: 0 0 0 0 rgba(61,122,90,0.4);
            animation: popIn 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) 0.3s both, pulse 2.5s ease-out 0.8s infinite;
        }

        @keyframes popIn {
            from { opacity: 0; transform: scale(0.4); }
            to   { opacity: 1; transform: scale(1); }
        }

        @keyframes pulse {
            0%   { box-shadow: 0 0 0 0 rgba(61,122,90,0.35); }
            70%  { box-shadow: 0 0 0 18px rgba(61,122,90,0); }
            100% { box-shadow: 0 0 0 0 rgba(61,122,90,0); }
        }

        /* Body text */
        .card-body {
            padding: 20px 40px 40px;
            text-align: center;
        }

        .card-body h1 {
            font-family: 'Playfair Display', serif;
            font-size: 30px;
            color: var(--warm-brown);
            margin-bottom: 12px;
            line-height: 1.2;
        }

        .username-badge {
            display: inline-block;
            background: linear-gradient(135deg, #fff4eb, #fde8d0);
            color: var(--orange);
            border: 1.5px solid rgba(224,123,57,0.25);
            border-radius: 100px;
            padding: 6px 18px;
            font-size: 15px;
            font-weight: 500;
            margin-bottom: 16px;
            letter-spacing: 0.3px;
        }

        .card-body p {
            color: var(--muted);
            font-size: 15px;
            line-height: 1.65;
            margin-bottom: 28px;
        }

        /* Divider */
        .divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 24px;
        }
        .divider::before, .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: #f0e8df;
        }
        .divider span { font-size: 18px; }

        /* CTA Button */
        .btn-login {
            display: block;
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, var(--orange) 0%, #c9622a 100%);
            color: white;
            text-decoration: none;
            border-radius: 14px;
            font-family: 'DM Sans', sans-serif;
            font-weight: 500;
            font-size: 16px;
            letter-spacing: 0.3px;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            box-shadow: 0 4px 16px rgba(224,123,57,0.35);
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(224,123,57,0.45);
        }
        .btn-login:active {
            transform: translateY(0);
        }

        /* Footer note */
        .card-footer {
            text-align: center;
            padding: 0 40px 28px;
            color: #c8b8ac;
            font-size: 12px;
        }
    </style>
</head>
<body>

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
