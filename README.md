# Design-and-Development-of-a-Secure-Web-Based-Authentication-System-Using-Java.
The application allows users to register, securely log in, log out and access a protected dashboard. It protects user credentials and prevents common authentication attacks.
# Secure Login and Registration System (Java PBL)

A beginner-friendly Java web application demonstrating secure user authentication.

## Features
- User registration and login
- BCrypt password hashing (cost factor 12)
- Prepared statements through JDBC
- Server-side validation
- CSRF tokens for POST forms
- Session ID renewal after successful login
- Protected dashboard
- 15-minute session inactivity timeout
- Temporary account lock after five failed attempts (15 minutes)
- Login activity audit table
- POST-only logout

## Requirements
- JDK 17
- Apache Maven 3.8+
- MySQL 8+
- Apache Tomcat 10.1+
- Eclipse IDE for Enterprise Java and Web Developers or IntelliJ IDEA

## Setup
1. Start MySQL.
2. Run `database/schema.sql` in MySQL Workbench or the MySQL command line.
3. Copy `src/main/resources/db.properties.example` to `src/main/resources/db.properties`.
4. Edit `db.properties` with your local database username and password.
5. In the project directory run: `mvn clean package`
6. Deploy `target/secure-login.war` to Tomcat 10.1 `webapps` (or run using your IDE's Tomcat server).
7. Open `http://localhost:8080/secure-login/`

## Test flow
1. Register with a valid name, email and password.
2. Password must be 8–72 characters and include uppercase, lowercase, a digit and a symbol.
3. Sign in and verify that the dashboard displays the user's name and email.
4. Try an incorrect password five times for a registered account; subsequent login attempts are temporarily blocked.
5. Try opening `/dashboard` in a logged-out browser; it should redirect to login.
6. Log out and use the browser Back button; the protected page should not be served from cache.

## Important notes
- This is a teaching/demo project, not a production-ready identity platform.
- Configure HTTPS before using it outside localhost.
- Do not commit `db.properties` or real secrets to source control.
- Use a least-privilege MySQL account rather than the root account for deployment.
- The simple account-lockout implementation is intentionally suitable for a small classroom demo. A production system should use atomic rate limiting, generic responses, monitoring, secure cookie settings, password reset controls, and a managed secrets solution.
- Error details are logged by the servlet container; never show stack traces to end users.

