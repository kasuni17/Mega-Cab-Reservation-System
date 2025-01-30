<%@ page import="java.sql.Connection" %>
<%@ page import="com.megacabservice.db.DBConn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<title>Cab Service -Index Page</title>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

header {
	background-color: #333;
	color: white;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
}

.navbar img {
	height: 75px;
	width: 100px
}

.navbar .buttons button {
	background-color: #f90;
	border: none;
	padding: 10px 15px;
	margin-left: 10px;
	color: white;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}

.navbar .buttons button:hover {
	background-color: #e68a00;
}

.nav-links {
	display: flex;
	justify-content: center;
	background-color: #555;
}

.nav-links a {
	text-decoration: none;
	color: white;
	padding: 15px 20px;
	display: block;
	font-weight: bold;
}

.nav-links a:hover, .nav-links a.book-now {
	background-color: #f90;
}

.banner {
	background: url('images/background/home.png') no-repeat center/cover;
	height: 330px;
	display: flex;
	justify-content: center;
	align-items: center;
	color: white;
	text-align: center;
	font-size: 2rem;
	font-weight: bold;
	padding-top: 260px;
}
/* General section styling */
.section {
	padding: 50px 10px;
	background: #000;
	color: #fff;
	text-align: center;
}

/* Title styling */
.services-title {
	font-family: 'Time new romen';
	font-size: 3rem;
	font-weight: 700;
	margin-bottom: 20px;
	color: #ffdd40;
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
	text-transform: uppercase;
}

/* Description styling */
.about-description {
	font-family: 'Times New Roman', serif;
	font-size: 1.5rem;
	line-height: 1.8;
	margin: 30px auto 20px auto;
	max-width: 800px;
	padding: 0 15px;
	color: black;
}

.about-image-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 15px;
}

.about-image {
	width: 100%;
	max-width: 500px;
}

.section p {
	font-size: 1.2rem;
	color: #666;
	margin-bottom: 30px;
	animation: fadeIn 1.2s ease-in-out;
}

/* Fleet Gallery Styling */
.fleet-gallery {
	display: flex;
	justify-content: center;
	gap: 20px;
	flex-wrap: wrap;
	animation: fadeIn 1.5s ease-in-out;
}

.fleet-item {
	position: relative;
	overflow: hidden;
	border-radius: 10px;
	width: 300px;
	height: 200px;
	background: #fff;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.fleet-item img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.3s ease;
}

/* Hover Effects */
.fleet-item:hover {
	transform: scale(1.05);
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}

.fleet-item:hover img {
	transform: scale(1.1);
}

/* Animations */
@
keyframes fadeIn { 0% {
	opacity: 0;
	transform: translateY(20px);
}

100


%
{
opacity


:


1
;


transform


:


translateY
(


0


)
;


}
}
.book-now-button {
	background-color: #f90;
	color: white;
	padding: 10px 20px;
	border: none;
	font-size: 1.2rem;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
}

.book-now-button:hover {
	background-color: #e68a00;
}

.why-choose-us {
	padding: 50px 20px;
	text-align: center;
	background: url('images/home/4.jpg') no-repeat center center/cover;
	color: #fff;
}

.why-choose-us .subheading {
	font-size: 1.2rem;
	font-weight: 300;
	color: #f8d210;
	margin-bottom: 30px;
}

.benefits {
	display: flex;
	justify-content: center;
	gap: 20px;
	flex-wrap: wrap;
	margin-top: 30px;
}

.benefit-item {
	background: rgba(0, 0, 0, 0.8);
	padding: 25px;
	border-radius: 8px;
	width: 300px;
	text-align: center;
	transition: transform 0.3s, box-shadow 0.3s ease;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
}

.benefit-item:hover {
	transform: scale(1.05);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.7);
}

.benefit-item .icon {
	font-size: 70px; /* Increased icon size */
	color: #ffffff; /* Icon color to match the design */
	margin-bottom: 15px;
}

.benefit-item .icon img {
	width: 100%;
	height: auto;
}

.benefit-item h3 {
	font-size: 1.5rem; /* Increased font size for headings */
	font-weight: bold;
	margin-bottom: 15px;
	color: #ffffff
}

.benefit-item p {
	font-size: 1rem;
	color: #ccc;
	line-height: 1.5;
	margin-bottom: 0;
}

.services-section {
	padding: 50px 20px;
	background: url('images/home/7.jpg') no-repeat center center/cover;
	text-align: center;
}

.services-title {
	font-size: 3rem;
	font-weight: bold;
	color: #fffff;
	margin: 0;
}

.services-subtitle {
	font-size: 1.2rem;
	color: #555;
	letter-spacing: 2px;
	margin-bottom: 20px;
}

.services-description {
	font-size: 1rem;
	line-height: 1.2rem;
	color: #444;
	margin: 10px auto 30px;
	max-width: 800px;
}

.services-grid {
	display: flex;
	justify-content: center;
	gap: 20px;
	flex-wrap: nowrap; /* Ensures cards do not wrap to the next line */
	overflow-x: auto; /* Allows horizontal scrolling if necessary */
}

.service-card {
	background: #ffffff;
	color: #222;
	border-radius: 8px;
	overflow: hidden;
	width: 300px; /* Adjusted for the cards to fit in one row */
	text-align: center;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.service-icon i {
	font-size: 3rem; /* Adjust icon size */
	color: #f8d210;
	margin-bottom: 20px;
}

.service-title {
	font-size: 1.3rem;
	font-weight: bold;
	margin: 15px 0;
	color: #222;
}

.service-description {
	font-size: 1rem;
	padding: 0 15px;
	margin-bottom: 20px;
	color: #555;
}

.cta-container {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #222;
	border-radius: 02px;
	padding: 30px 60px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	text-align: center;
}

.cta-text {
	color: #fff;
	font-size: 1.5rem;
	font-weight: bold;
	margin-right: 20px;
}

.cta-button {
	background-color: #ff8200;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 1rem;
	margin-right: 20px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.cta-button:hover {
	background-color: #e97000;
}

.cta-link {
	color: #fff;
	text-decoration: none;
	font-size: 1rem;
	display: flex;
	align-items: center;
	transition: color 0.3s ease;
}

.cta-link:hover {
	color: #ff8200;
}

.cta-arrow {
	margin-left: 5px;
	font-size: 1.2rem;
}
</style>
</head>
<body>
	<%@include file="All_Components/Navbar.jsp"%>

<% Connection conn=DBConn.getConn();
out.println(conn);
%>
	<div class="banner"></div>

	<!-- About Section -->
	<div class="section" id="about">
		<div class="about-container">
			<h1 class="services-title">ABOUT OUR CAB SERVICE</h1>
			<p class="about-description">Mega City Cab is Colombo's trusted
				cab service, serving thousands of customers every month. We ensure
				reliable, affordable, and timely transportation, backed by a modern
				computerized system.</p>
			<div class="about-image-container">
				<img src="images/background/about(a).png" alt="About Cab Service"
					class="about-image">
			</div>
		</div>
	</div>

	<section class="services-section">
		<div class="container">
			<h1 class="services-title">SERVICES</h1>
			<p class="services-subtitle">RELIABLE CAB SERVICES IN COLOMBO</p>
			<p class="services-description">Mega City Cab offers dependable
				cab services in Colombo City, providing smooth transportation for
				thousands of customers every month. From local trips to airport
				transfers and special event rides, we prioritize comfort and
				reliability.</p>
			<div class="services-grid">
				<div class="service-card">
					<div class="service-icon">
						<i class="fas fa-car"></i>
						<!-- Local Pick-Up Icon -->
					</div>
					<h3 class="service-title">LOCAL PICK-UP AND DROP-OFF</h3>
					<p class="service-description">Quick and hassle-free rides for
						your daily errands, school runs, or business meetings. Our drivers
						ensure timely and safe pick-ups and drop-offs within Colombo.</p>
				</div>
				<div class="service-card">
					<div class="service-icon">
						<i class="fas fa-plane-departure"></i>
						<!-- Airport Transfers Icon -->
					</div>
					<h3 class="service-title">AIRPORT TRANSFERS</h3>
					<p class="service-description">Travel comfortably to and from
						Bandaranaike International Airport. We ensure a stress-free
						experience with punctual and professional service.</p>
				</div>
				<div class="service-card">
					<div class="service-icon">
						<i class="fas fa-briefcase"></i>
						<!-- Corporate Services Icon -->
					</div>
					<h3 class="service-title">CORPORATE SERVICES</h3>
					<p class="service-description">Efficient and reliable
						transportation solutions for corporate events, meetings, and
						conferences. Trust Mega City Cab for your business travel needs.</p>
				</div>
				<div class="service-card">
					<div class="service-icon">
						<i class="fas fa-gift"></i>
						<!-- Event Services Icon -->
					</div>
					<h3 class="service-title">SPECIAL EVENT TRANSPORT</h3>
					<p class="service-description">Need a ride for weddings,
						parties, or other special occasions? We provide stylish and
						comfortable transport to make your day memorable.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Services Section -->
	<div class="section" id="fleet">
		<h1 class="services-title">OUR FLEET</h1>
		<p>Choose from a variety of vehicles for your travel needs.</p>
		<div class="fleet-gallery">
			<div class="fleet-item">
				<img src="images/Car/SUV_1.png" alt="Cab 1">
			</div>
			<div class="fleet-item">
				<img src="images/Car/L_3.png" alt="Cab 2">
			</div>
			<div class="fleet-item">
				<img src="images/Car/E_1.png" alt="Cab 3">
			</div>
		</div>
	</div>

	<section class="why-choose-us">
		<div class="container">
			<h1 class="services-title">WHY CHOOSE MEGA CITY CAB</h1>
			<p class="subheading">The Ultimate Cab Service Experience</p>
			<div class="benefits">
				<div class="benefit-item">
					<div class="icon">
						<i class="fas fa-shield-alt"></i>
						<!-- Safety Icon -->
					</div>
					<h3>Safety First</h3>
					<p>Your safety is our top priority. With fully insured drivers
						and regularly maintained vehicles, we guarantee a safe journey
						every time.</p>
				</div>
				<div class="benefit-item">
					<div class="icon">
						<i class="fas fa-user-tie"></i>
						<!-- Driver Icon -->
					</div>
					<h3>Experienced & Professional Drivers</h3>
					<p>Our drivers are carefully selected for their experience and
						professionalism. They are trained to provide you with a
						comfortable and secure ride.</p>
				</div>
				<div class="benefit-item">
					<div class="icon">
						<i class="fas fa-clock"></i>
						<!-- 24/7 Icon -->
					</div>
					<h3>24/7 Availability</h3>
					<p>Whether it’s early morning or late at night, our service is
						available around the clock to meet your travel needs.</p>
				</div>
				<div class="benefit-item">
					<div class="icon">
						<i class="fas fa-map-marker-alt"></i>
						<!-- GPS Icon -->
					</div>
					<h3>Real-Time GPS Tracking</h3>
					<p>Stay informed with real-time GPS tracking. You can track
						your cab's location and estimated arrival time through our app.</p>
				</div>
				<div class="benefit-item">
					<div class="icon">
						<i class="fas fa-dollar-sign"></i>
						<!-- Affordable Icon -->
					</div>
					<h3>Affordable & Transparent Rates</h3>
					<p>Our pricing is competitive and transparent, with no hidden
						charges. You get high-quality service without breaking the bank.</p>
				</div>
				<div class="benefit-item">
					<div class="icon">
						<i class="fas fa-laptop"></i>
						<!-- Online Booking Icon -->
					</div>
					<h3>Easy Online Booking</h3>
					<p>Booking your cab has never been easier. Use our website or
						mobile app for a fast and easy booking experience, anytime,
						anywhere.</p>
				</div>
			</div>
		</div>
	</section>


	<div class="cta-container">
		<div class="cta-text">
			<h1 class="services-title">Start Your Journey</h1>
		</div>
		<button class="cta-button">Book now</button>

	</div>

	<!-- Help Section -->
	<%@include file="HelpSection.jsp"%>
	
	
	<!-- footer -->
	<%@include file="All_Components/footer.jsp"%>
</body>
</html>
