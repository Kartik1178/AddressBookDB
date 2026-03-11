USE AddressBookDB;

CREATE TABLE AddressBook (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    address VARCHAR(200),
    city VARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(10),
    phoneNumber VARCHAR(15),
    email VARCHAR(100)
);
SHOW TABLES;