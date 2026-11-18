CREATE DATABASE IF NOT EXISTS secure_login_db
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE secure_login_db;

CREATE TABLE IF NOT EXISTS users (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(190) NOT NULL UNIQUE,
  password_hash VARCHAR(100) NOT NULL,
  failed_attempts INT NOT NULL DEFAULT 0,
  locked_until DATETIME NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS login_activity (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  user_id BIGINT NULL,
  email_attempted VARCHAR(190) NOT NULL,
  success BOOLEAN NOT NULL,
  ip_address VARCHAR(45) NULL,
  attempted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_activity_user FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE SET NULL
);

CREATE INDEX idx_activity_email_time ON login_activity(email_attempted, attempted_at);
