-- Table for storing user accounts
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- Table for storing hotel information
CREATE TABLE hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    adults INT NOT NULL,
    kids INT NOT NULL,
    rooms INT NOT NULL,
    amenities VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL
);

-- Table for storing user bookings
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    hotel_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    adults INT NOT NULL,
    kids INT NOT NULL,
    rooms INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
);

-- Table for storing user details for bookings
CREATE TABLE booking_details (
    booking_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    country_code VARCHAR(10) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    billing_address VARCHAR(255) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);


CREATE TABLE `reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` text NOT NULL,
  `email` text NOT NULL,
  `country_code` text NOT NULL,
  `phone_number` text NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE payment_details (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    card_number VARCHAR(16) NOT NULL,
    expiry_date VARCHAR(5) NOT NULL,
    cvv VARCHAR(3) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
