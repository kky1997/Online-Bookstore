CREATE DATABASE bookstore;
USE bookstore;

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    username VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE,
    passwords VARCHAR(255),
    phone_number VARCHAR(255),
    profile_pic_path VARCHAR(255),
    PRIMARY KEY(user_id)
);

CREATE TABLE Address (
    address_id INT AUTO_INCREMENT,
    user_id INT,
    address VARCHAR(255),
    PRIMARY KEY (address_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Advertisement (
    advertisment_id INT AUTO_INCREMENT,
    date_created VARCHAR(255),
    seller_id INT,
    book_id INT,
    PRIMARY KEY (advertisment_id),
    FOREIGN KEY (seller_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Book(book_id) ON DELETE NO ACTION
);

CREATE TABLE Sale_History (
    sale_id INT AUTO_INCREMENT,
    sell_date VARCHAR(255),
    sell_price DECIMAL(10, 2),
    seller_id INT,
    book_id INT,
    PRIMARY KEY (sale_id),
    FOREIGN KEY (seller_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Book(book_id) ON DELETE NO ACTION
);

CREATE TABLE Purchase_History (
    purchase_id INT AUTO_INCREMENT,
    purchase_price DECIMAL (10, 2),
    purchase_date VARCHAR(255),
    book_id INT,
    buyer_id INT,
    PRIMARY KEY (purchase_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id) ON DELETE NO ACTION,
    FOREIGN KEY (buyer_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Book (
    book_id INT AUTO_INCREMENT,
    title VARCHAR(255),
    author_first_name VARCHAR(255),
    author_last_name VARCHAR(255),
    ISBN VARCHAR(255),
    price DECIMAL (10, 2),
    transaction_status INT DEFAULT 0, /*0 means not sold, 1 means sold*/
    PRIMARY KEY (book_id)
);

CREATE TABLE Messages (
    message_id INT AUTO_INCREMENT,
    seller_id INT,
    buyer_id INT,
    message TEXT,
    send_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (message_id),
    FOREIGN KEY (seller_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (buyer_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

SET FOREIGN_KEY_CHECKS = 1;