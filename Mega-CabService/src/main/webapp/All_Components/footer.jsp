<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

footer {
	background: #000;
	color: #fff;
	padding: 50px 20px;
	font-family: 'Arial', sans-serif;
}

.footer-container {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	flex-wrap: wrap;
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

.footer-logo {
	flex: 1;
	max-width: 250px;
	text-align: center;
	margin-right: 55px;
}

.footer-logo img {
	max-width: 150px;
	margin-bottom: 15px;
	transition: transform 0.3s ease;
}

.footer-logo img:hover {
	transform: scale(1.1);
}

.footer-logo p {
	font-size: 14px;
	margin-top: 10px;
	color: #d0d0d0;
}

.footer-contact, .footer-nav, .footer-social {
	flex: 1;
	margin: 25px;
}

.footer-contact h3, .footer-nav h3, .footer-social h3 {
	color: #ffd700;
	font-size: 18px;
	margin-bottom: 10px;
}

.footer-contact p, .footer-nav ul li, .footer-social a {
	margin: 10px 0;
	font-size: 16px;
	color: #fff;
}

.footer-contact p i, .footer-nav ul li i, .footer-social a i {
	margin-right: 10px;
	color: #ffd700;
}

.footer-nav ul {
	list-style: none;
	padding: 0;
}

.footer-nav ul li a {
	color: #fff;
	text-decoration: none;
	transition: color 0.3s ease;
}

.footer-nav ul li a:hover {
	color: #0056b3;
}

.footer-social {
	text-align: center;
}

.footer-social a {
	font-size: 24px;
	margin: 0 10px;
	color: #ffd700;
	transition: transform 0.3s ease, color 0.3s ease;
}

.footer-social a:hover {
	transform: scale(1.2);
	color: #0056b3;
}

.footer-bottom {
	margin-top: 30px;
	border-top: 1px solid #fff;
	padding-top: 15px;
	text-align: center;
}

.footer-bottom p {
	font-size: 14px;
}

.footer-bottom .brand-name {
	font-weight: bold;
	color: #ffd700;
}

.footer-bottom .designer {
	font-style: italic;
	color: #0056b3;
}

/* Responsive Design */
@media ( max-width : 768px) {
	.footer-container {
		flex-direction: column;
		align-items: center;
		text-align: center;
	}
	.footer-contact, .footer-nav, .footer-social {
		margin: 100px 0;
	}
}

</style>
</head>
<body>
	
	<footer>
		<div class="footer-container">
			<!-- Logo Section -->
			<div class="footer-logo">
				<img src="images/background/logo3.png" alt="Logo">
				<p>Your trusted cab service in Colombo City.</p>
			</div>
			<!-- Contact Information Section -->
			<div class="footer-contact">
				<h3>Contact Us</h3>
				<p>
					<i class="fa fa-phone"></i> +1 234 567 890
				</p>
				<p>
					<i class="fa fa-envelope"></i> info@example.com
				</p>
				<p>
					<i class="fa fa-map-marker"></i> 123 Main Street, Colombo City
				</p>
			</div>

			<!-- Navigation Links Section -->
			<div class="footer-nav">
				<h3>Quick Links</h3>
				<ul>
					<li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="about.html"><i class="fa fa-user"></i> About
							Us</a></li>
					<li><a href="services.html"><i class="fa fa-cogs"></i>Services</a></li>
					<li><a href="contact.html"><i class="fa fa-envelope"></i>Contact
							Us</a></li>
				</ul>
			</div>
			<!-- Social Media Section -->
			<div class="footer-social">
				<h3>Follow Us</h3>
				<a href="#" target="_blank"><i
					class="fa-brands fa-facebook fa-fade" style="color: #FFD43B;"></i></a>
				<a href="#" target="_blank"><i
					class="fa-brands fa-instagram fa-fade" style="color: #FFD43B;"></i></a>
				<a href="#" target="_blank"><i
					class="fa-brands fa-linkedin fa-fade" style="color: #FFD43B;"></i></a>
			</div>
		</div>

		<div class="footer-bottom">
			<p>
				&copy; 2025 <span class="brand-name">Mega City Cab</span>. Allrights
				reserved. | Designed by <span class="designer">Kasuni Peiris</span>
			</p>
		</div>
	</footer>
</body>
</html>