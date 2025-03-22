# 🚖 Mega Cab Reservation System

This repository contains the **Mega Cab Reservation System**, a Maven-based web application designed to streamline cab reservations, user authentication, ride management, and more for a cab service provider.

---

## 🛠 Technologies Used

| Technology       | Purpose                                                                 |
|------------------|-------------------------------------------------------------------------|
| Eclipse IDE       | Development environment for Java applications                           |
| Maven             | Project management and dependency handling                              |
| Tomcat 9          | Servlet container to run the web application                            |
| MySQL             | Database to store customers, rides, and reservations                    |
| Bootstrap 5       | Frontend framework for responsive UI                                    |
| Font Awesome      | Icon library for UI components                                         |
| JUnit 5           | Unit testing framework                                                  |
| Mockito 5         | Mocking framework for testing                                           |
| SHA-256 Hashing   | Secure password hashing                                                 |
| JavaMail API      | Send email notifications for ride confirmations and updates             |

---

## 🚀 Features

- ✅ **User Authentication**: Secure login and registration with SHA-256 password hashing.
- ✅ **Cab Reservation**: Customers can book rides and view upcoming reservations.
- ✅ **Admin Panel**: Manage drivers, cabs, and bookings efficiently.
- ✅ **Ride Management**: Assign rides to available drivers and track ride status.
- ✅ **Email Notifications**: Customers receive ride confirmations and updates.
- ✅ **Responsive Design**: Mobile-friendly UI using Bootstrap.

---

## 📦 Setup Instructions

### 1️⃣ Prerequisites
Ensure you have the following installed:
- Java 17+
- Apache Maven
- MySQL Server
- Tomcat 9+
- Eclipse IDE (or any preferred Java IDE)

### 2️⃣ Clone the Repository
https://github.com/kasuni17/Mega-Cab-Reservation-System.git

# Mega City Cab Service System

## 3️⃣ Database Setup
1. Create a MySQL database named `mega_cab_service`.
2. Import the provided `database.sql` file to set up the necessary tables.
3. Update the database connection details in the `application.properties` file:

```properties
url=jdbc:mysql://127.0.0.1:3306/mega_cab_service
username=root
password=12345
```

## 4️⃣ Build and Run
Run the following commands to build and start the application:

```sh
mvn clean install
mvn tomcat7:run
```

The application will be available at [http://localhost:8080/](http://localhost:8080/).

---

## 🛠 CI/CD Workflow
This project uses **GitHub Actions** for Continuous Integration (CI) and Continuous Deployment (CD).

### 🔹 On every push or pull request to the `master` branch, the pipeline:
- Runs automated tests with **JUnit & Mockito**.
- Builds the application using **Maven**.
- Deploys to the production server after successful tests.

**Workflow File:** `.github/workflows/maven.yml`

---

## 📄 License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments
- Thanks to **Font Awesome** for the UI components.
- Special thanks to the open-source community for their contributions.

---

## 📧 Contact
For any queries or feedback, feel free to reach out:

- **Email:** kasuniik417@gmail.com
- **GitHub:** [kasuni17](https://github.com/kasuni17)
