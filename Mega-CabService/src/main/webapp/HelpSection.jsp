<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Help - Mega City Cab System</title>

<!-- Google Fonts -->
<link
    href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&family=Montserrat:wght@500;600&display=swap"
    rel="stylesheet">

<!-- Font Awesome for Icons -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>

.help-container {
    max-width: 12000px;
    margin: px auto;
    padding: 50px;
    background: url('images/background/about.png') no-repeat center/cover;
}

.help-content {
    display: grid;
    grid-template-columns: repeat(3, 1fr); 
    gap: 40px;
}

.help-card {
    perspective: 1000px;
}

.help-card-inner {
    position: relative;
    width: 100%;
    height: 250px;
    transform-style: preserve-3d;
    transition: transform 0.8s;
}

.help-card:hover .help-card-inner {
    transform: rotateY(180deg);
}

.help-card-front, .help-card-back {
    position: absolute;
    width: 100%;
    height: 100%;
    backface-visibility: hidden;
    border-radius: 15px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    color: white;
    text-align: center;
}

.help-card-front {
    background: linear-gradient(135deg, #f3f3c0, #121730);
}

.help-card-back {
    background-color: #03030397;
    transform: rotateY(180deg);
    padding: 20px;
}

.help-card i {
    font-size: 50px;
    margin-bottom: 15px;
}

.help-card h2 {
    font-size: 24px;
    font-weight: 600;
    margin: 10px 0;
    text-transform: uppercase;
}

.help-card p {
    font-size: 16px;
    opacity: 0.85;
}
</style>
</head>
<body>
    <section class="services-section">
        <div class="container">
            <h1 class="services-title">Welcome to the Mega City Cab Help Section</h1>
            <p>Your guide to all the features and tips for seamless operations.</p>
        </div>
    </section>

    <div class="help-container">
        <section class="help-content">
            <div class="help-card">
                <div class="help-card-inner">
                    <div class="help-card-front">
                        <i class="fas fa-user"></i>
                        <h2>Login</h2>
                    </div>
                    <div class="help-card-back">
                        <h2>Login</h2>
                        <p>Access your account to manage bookings and more.</p>
                    </div>
                </div>
            </div>

            <div class="help-card">
                <div class="help-card-inner">
                    <div class="help-card-front">
                        <i class="fas fa-plus-circle"></i>
                        <h2>Create Booking</h2>
                    </div>
                    <div class="help-card-back">
                        <h2>Create Booking</h2>
                        <p>Make a booking by entering the customer details.</p>
                    </div>
                </div>
            </div>

            <div class="help-card">
                <div class="help-card-inner">
                    <div class="help-card-front">
                        <i class="fas fa-search"></i>
                        <h2>Search Bookings</h2>
                    </div>
                    <div class="help-card-back">
                        <h2>Search Bookings</h2>
                        <p>Find and modify bookings quickly with our search feature.</p>
                    </div>
                </div>
            </div>

            <div class="help-card">
                <div class="help-card-inner">
                    <div class="help-card-front">
                        <i class="fas fa-calculator"></i>
                        <h2>Calculate Bill</h2>
                    </div>
                    <div class="help-card-back">
                        <h2>Calculate Bill</h2>
                        <p>Get the total fare calculation based on distance and taxes.</p>
                    </div>
                </div>
            </div>

            <div class="help-card">
                <div class="help-card-inner">
                    <div class="help-card-front">
                        <i class="fas fa-sign-out-alt"></i>
                        <h2>Logout</h2>
                    </div>
                    <div class="help-card-back">
                        <h2>Logout</h2>
                        <p>Log out safely from the system once you are done.</p>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>