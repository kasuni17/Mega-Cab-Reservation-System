<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
            background: #0a0a0a;
            color: #ffffff;
            position: relative;
            overflow-x: hidden;
        }

        .banner {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),
                        url('https://images.unsplash.com/photo-1586023492125-27b2c045efd7') center/cover;
            height: 300px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 40px;
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .neon-text {
            text-shadow: 0 0 10px #ffd700;
        }

        .header {
            text-align: center;
            margin-bottom: 50px;
            animation: slideDown 1s ease;
        }

        .header h1 {
            font-size: 3.5rem;
            margin-bottom: 15px;
            color: #ffd700;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .header p {
            color: #ffffffaa;
            font-size: 1.2rem;
        }

        .contact-wrapper {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            padding: 40px;
            border: 1px solid rgba(255,255,255,0.1);
            animation: fadeIn 1.5s ease;
        }

        .info-card {
            background: rgba(0,0,0,0.3);
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 25px;
            transition: all 0.3s ease;
            border: 1px solid #ffd70033;
        }

        .info-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(255,215,0,0.2);
        }

        .info-card h3 {
            display: flex;
            align-items: center;
            gap: 15px;
            color: #ffd700;
            margin-bottom: 15px;
        }

        .info-card i {
            font-size: 1.5rem;
            color: #ffd700;
        }

        .form-group {
            margin-bottom: 25px;
        }

        input, textarea {
            width: 100%;
            padding: 15px;
            background: rgba(255,255,255,0.1);
            border: 1px solid #2a2a2a;
            border-radius: 8px;
            color: #fff;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input:focus, textarea:focus {
            outline: none;
            border-color: #ffd700;
            box-shadow: 0 0 15px rgba(255,215,0,0.2);
        }

        button {
            background: #ffd700;
            color: #0a0a0a;
            padding: 15px 40px;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        button:hover {
            background: #ccb000;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(255,215,0,0.3);
        }

        .map-section {
            margin-top: 40px;
            border-radius: 15px;
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.1);
            animation: slideUp 1s ease;
        }

        /* Animations */
        @keyframes slideDown {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @media (max-width: 768px) {
            .contact-wrapper {
                grid-template-columns: 1fr;
                padding: 25px;
            }
            
            .header h1 {
                font-size: 2.5rem;
            }
            
            .banner {
                height: 200px;
            }
        }
    </style>
</head>
<body>
    <%@include file="All_Components/Navbar.jsp" %>
    <div class="banner">
        <div class="header">
            <h1 class="neon-text">Colombo Mega Cabs</h1>
            <p>24/7 Premium Taxi Service in Sri Lanka</p>
        </div>
    </div>

    <div class="container">
        <div class="contact-wrapper">
            <div class="contact-info">
                <div class="info-card">
                    <h3><i class="fas fa-map-marker-alt" aria-label="Location"></i>Headquarters</h3>
                    <p>No. 123 Galle Road,<br>Colombo 03, Sri Lanka</p>
                </div>
                
                <div class="info-card">
                    <h3><i class="fas fa-clock" aria-label="Operating Hours"></i>Operating Hours</h3>
                    <p>24/7 Service<br>365 Days Availability</p>
                </div>

                <div class="info-card">
                    <h3><i class="fas fa-phone" aria-label="Contact"></i>Contact</h3>
                    <p>Hotline: +94 112 345 678<br>Mobile: +94 765 432 109</p>
                </div>

                <div class="info-card">
                    <h3><i class="fas fa-envelope" aria-label="Support"></i>Support</h3>
                    <p>bookings@colombomegacabs.lk<br>support@colombomegacabs.lk</p>
                </div>
            </div>

            <form class="contact-form" action="contact" method="POST" onsubmit="return validateForm()">
                <div class="form-group">
                    <input type="text" name="name" placeholder="Your Name" required>
                </div>
                <div class="form-group">
                    <input type="email" name="email" placeholder="Your Email" required>
                </div>
                <div class="form-group">
                    <input type="tel" name="phone" placeholder="Contact Number" required pattern="[0-9]{10}">
                </div>
                <div class="form-group">
                    <textarea name="message" placeholder="Special Requirements" rows="4" required></textarea>
                </div>
                <button type="submit">
                    <i class="fas fa-taxi"></i>
                    Send
                </button>
            </form>
        </div>

        <div class="map-section">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63371.815291161!2d79.8217312272537!3d6.921837369008361!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae253d10f7a7003%3A0x320b2e4d32d3838d!2sColombo!5e0!3m2!1sen!2slk!4v1690000000000!5m2!1sen!2slk" 
                    width="100%" 
                    height="400" 
                    style="border:0;" 
                    allowfullscreen="" 
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
    </div>
     
    <!-- footer -->
    <%@include file="All_Components/footer.jsp"%>
    
    <script>
        function validateForm() {
            const name = document.querySelector('input[name="name"]').value.trim();
            const email = document.querySelector('input[name="email"]').value.trim();
            const phone = document.querySelector('input[name="phone"]').value.trim();
            const message = document.querySelector('textarea[name="message"]').value.trim();

            if (!name || !email || !phone || !message) {
                alert("Please fill out all fields.");
                return false;
            }

            if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            if (!/^\d{10}$/.test(phone)) {
                alert("Please enter a valid 10-digit phone number.");
                return false;
            }

            return true;
        }

        const urlParams = new URLSearchParams(window.location.search);
        const status = urlParams.get('status');
        if (status === 'success') {
            alert('Message sent successfully!');
        } else if (status === 'failed') {
            alert('Failed to send message. Please try again.');
        }
    </script>
</body>
</html>