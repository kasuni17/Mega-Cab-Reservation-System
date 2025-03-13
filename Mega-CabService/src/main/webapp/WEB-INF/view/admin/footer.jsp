<footer>
    <div class="footer-container">
        <!-- Footer Logo Section -->
        <div class="footer-logo">
            <img src="images/background/logo3.png" alt="Logo">
            <p>Your trusted cab service for efficient management.</p>
        </div>

        <!-- Footer Navigation Section -->
        <div class="footer-nav">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="admin_home.jsp"><i class="fas fa-home"></i> Dashboard</a></li>
                <li><a href="viewCabs"><i class="fas fa-car"></i> Manage Cabs</a></li>
                <li><a href="view_drivers"><i class="fas fa-users"></i> Manage Drivers</a></li>
                <li><a href="viewUsers"><i class="fas fa-user-cog"></i> Manage Users</a></li>
                <li><a href="admin/viewBookings"><i class="fas fa-calendar-alt"></i> Manage Bookings</a></li>
                <li><a href="admin/adminBookings"><i class="fas fa-money-bill-wave"></i> Payments</a></li>
                <li><a href="messages"><i class="fas fa-comment-dots"></i> Messages</a></li>
            </ul>
        </div>

        <!-- Footer Contact Information Section -->
        <div class="footer-contact">
            <h3>Contact Us</h3>
            <p><i class="fas fa-phone-alt"></i> +1 234 567 890</p>
            <p><i class="fas fa-envelope"></i> support@megacitycab.com</p>
            <p><i class="fas fa-map-marker-alt"></i> 123 Main Street, Colombo City</p>
        </div>

        <!-- Footer Social Media Section -->
        <div class="footer-social">
            <h3>Follow Us</h3>
            <a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
            <a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
        </div>
    </div>

    <!-- Footer Bottom Section -->
    <div class="footer-bottom">
        <p>&copy; 2025 <span class="brand-name">Mega City Cab</span>. All rights reserved.</p>
        <p>Designed by <span class="designer">Kasuni Peiris</span></p>
    </div>
</footer>

<style>
footer {
    background-color: #262626;
    color: #ffffff;
    padding: 40px 0;
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

.footer-nav, .footer-contact, .footer-social {
    flex: 1;
    margin: 0 20px;
    max-width: 300px;
}

.footer-nav h3, .footer-contact h3, .footer-social h3 {
    color: #ffdd57;
    font-size: 18px;
    margin-bottom: 15px;
}

.footer-nav ul {
    list-style: none;
    padding: 0;
}

.footer-nav ul li {
    margin: 10px 0;
}

.footer-nav ul li a {
    color: #ffffff;
    text-decoration: none;
    font-size: 16px;
    transition: color 0.3s ease;
}

.footer-nav ul li a:hover {
    color: #ffdd57;
}

.footer-contact p, .footer-social a {
    font-size: 16px;
    margin: 10px 0;
}

.footer-contact p i, .footer-social a i {
    color: #ffdd57;
    margin-right: 10px;
}

.footer-social a {
    font-size: 24px;
    margin: 0 10px;
    color: #ffdd57;
    transition: transform 0.3s ease, color 0.3s ease;
}

.footer-social a:hover {
    transform: scale(1.2);
    color: #ffdd57;
}

.footer-bottom {
    margin-top: 30px;
    border-top: 1px solid #ffffff;
    padding-top: 15px;
    text-align: center;
}

.footer-bottom p {
    font-size: 14px;
}

.brand-name {
    font-weight: bold;
    color: #ffdd57;
}

.designer {
    font-style: italic;
    color: #ffdd57;
}

@media (max-width: 768px) {
    .footer-container {
        flex-direction: column;
        text-align: center;
    }

    .footer-nav, .footer-contact, .footer-social {
        margin: 20px 0;
    }
}
</style>

