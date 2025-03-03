<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - Next Level</title>   
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #121212, #1e1e1e);
        color: #fff;
        line-height: 1.6;
    }
    h1, h2, h3, h4, p {
        line-height: 2rem;
    }
    h1 {
        font-size: 4rem;
        background: linear-gradient(45deg, #ff9a9e, #fad0c4);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }
    .hero {
        background: url('images/background/about.png') no-repeat center center/cover;
        text-align: center;
        color: white;
        padding: 260px 20px;
        position: relative;
        animation: fadeIn 1.5s ease-in-out;
    }
    .hero h1, .hero h4 {
        margin: 0;
        line-height: 1.4;
    }
    .container {
        width: 80%;
        margin: auto;
        padding: 20px;
        text-align: center;
    }
    .mission-vision {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 20px;
        background: rgba(255, 255, 255, 0.1);
        padding: 40px;
        border-radius: 15px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.1);
    }
    .mission, .vision {
        flex: 1;
        padding: 20px;
        background: rgba(34, 34, 34, 0.8);
        box-shadow: 0 0 15px rgba(255, 255, 255, 0.1);
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        border-radius: 10px;
        text-align: center;
        line-height: 1.8;
    }
    .mission:hover, .vision:hover {
        transform: scale(1.05);
        box-shadow: 0 0 25px rgba(255, 255, 255, 0.2);
    }
    .mission-vision img {
        width: 400px;
        border-radius: 10px;
        transition: transform 0.3s ease-in-out;
    }
    .mission-vision img:hover {
        transform: scale(1.1);
    }
    .team {
        text-align: center;
        padding: 40px;
        background: rgba(30, 30, 30, 0.8);
        border-radius: 15px;
        margin: 40px 0;
    }
    .team-container {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 20px;
    }
    .team-member {
        text-align: center;
        padding: 20px;
        background: rgba(34, 34, 34, 0.8);
        box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        border-radius: 10px;
        width: 200px;
    }
    .team-member:hover {
        transform: scale(1.05);
        box-shadow: 0 0 20px rgba(255, 255, 255, 0.2);
    }
    .team-member img {
        width: 200px;
        border-radius: 1%;
        transition: transform 0.3s ease-in-out;
    }
    .team-member img:hover {
        transform: scale(1.1);
    }
    .team-member p {
        line-height: 1.8;
    }
    .mission h2, .vision h2 {
        margin-bottom: 15px;
        line-height: 1.4;
        color: gold;
    }
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
</style>
</head>
<body>
<%@include file="All_Components/Navbar.jsp"%>
    <section class="hero" data-aos="fade-up">
        <h1>About Us</h1>
        <h4>Providing top-notch cab services with comfort, safety, and affordability.</h4>
    </section>
    <section class="about">
        <div class="container" data-aos="fade-right">
            <h2>Who We Are</h2>
            <p>We are a premier cab service dedicated to providing safe, reliable, and affordable transportation. Our fleet of well-maintained vehicles and experienced drivers ensure that you reach your destination comfortably and on time.</p>
        </div>
    </section>
    <section class="mission-vision">
        <div class="mission" data-aos="zoom-in">
            <h2>Our Mission</h2>
            <p>To offer a seamless and enjoyable ride experience while ensuring safety and affordability.</p>
        </div>
        <img src="images/background/contactus.png" alt="Mission and Vision">
        <div class="vision" data-aos="zoom-in">
            <h2>Our Vision</h2>
            <p>To be the most trusted and preferred cab service provider in the region.</p>
        </div>
    </section>
  
    <section class="team" data-aos="fade-left">
        <h2>Meet Our Team</h2>
        <div class="team-container">
            <div class="team-member">
                <img src="images/About/ceo.jpg" alt="Team Member">
                <h3>Sarath Kumara</h3>
                <p>Founder & CEO</p>
            </div>
            <div class="team-member">
                <img src="images/About/manager.jpg" alt="Team Member">
                <h3>Nimali Perera</h3>
                <p>Operations Manager</p>
            </div>
            <div class="team-member">
                <img src="images/About/driver.jpg" alt="Team Member">
                <h3>Dilantha Wijesinghe</h3>
                <p>Lead Driver</p>
            </div>
        </div>
    </section>
    <!-- footer -->
    <%@include file="All_Components/footer.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>