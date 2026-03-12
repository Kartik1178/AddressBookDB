# Address Book Database System

## Project Description

This project implements an **Address Book Service Database** using **MySQL Workbench**.
The system allows storing, managing, and retrieving contact information such as names, addresses, phone numbers, and emails.

The project follows **incremental development using Git Flow**, where each **Use Case (UC)** is implemented in a separate **feature branch**.

The implementation demonstrates:

* Database creation
* Table design
* CRUD operations
* SQL queries for retrieval and aggregation
* Database normalization
* ER modeling

---

# Technologies Used

* MySQL Workbench
* MySQL Database
* Git
* Git Flow
* SQL

---

# Database Name

```
AddressBookDB
```

---

# Table Structure

## AddressBook

| Column      | Type                           |
| ----------- | ------------------------------ |
| id          | INT AUTO_INCREMENT PRIMARY KEY |
| firstName   | VARCHAR(50)                    |
| lastName    | VARCHAR(50)                    |
| address     | VARCHAR(200)                   |
| city        | VARCHAR(50)                    |
| state       | VARCHAR(50)                    |
| zip         | VARCHAR(10)                    |
| phoneNumber | VARCHAR(15)                    |
| email       | VARCHAR(100)                   |

---

# Use Case Implementation

## UC1 – Create Address Book Database

Create the database using MySQL Workbench.

```sql
CREATE DATABASE AddressBookDB;
USE AddressBookDB;
```

---

## UC2 – Create Address Book Table

Create a table with attributes for storing contact details.

```sql
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
```

---

## UC3 – Insert Contacts

Insert new contacts into the address book.

```sql
INSERT INTO AddressBook
(firstName,lastName,address,city,state,zip,phoneNumber,email)
VALUES
('Kartikeya','Pusapati','Guduvancheri','Chennai','TN','603202','9876543210','kartik@email.com'),
('Rahul','Sharma','Indira Nagar','Bangalore','KA','560038','9123456789','rahul@email.com'),
('Anita','Reddy','Banjara Hills','Hyderabad','TS','500034','9988776655','anita@email.com');
```

---

## UC4 – Edit Existing Contact

Update details of an existing contact.

```sql
UPDATE AddressBook
SET city = 'Mumbai'
WHERE id = 2;
```

---

## UC5 – Delete Contact

Delete a person from the address book.

```sql
DELETE FROM AddressBook
WHERE id = 3;
```

---

## UC6 – Retrieve Contacts by City or State

```sql
SELECT *
FROM AddressBook
WHERE city='Chennai'
OR state='TN';
```

---

## UC7 – Count Contacts by City and State

```sql
SELECT city, COUNT(*) AS contactCount
FROM AddressBook
GROUP BY city;

SELECT state, COUNT(*) AS contactCount
FROM AddressBook
GROUP BY state;
```

---

## UC8 – Sort Contacts Alphabetically

```sql
SELECT *
FROM AddressBook
WHERE city='Chennai'
ORDER BY firstName;
```

---

## UC9 – Add AddressBook Name and Type

```sql
ALTER TABLE AddressBook
ADD addressBookName VARCHAR(50),
ADD addressBookType VARCHAR(50);
```

---

## UC10 – Count Contacts by Type

```sql
SELECT addressBookType, COUNT(*)
FROM AddressBook
GROUP BY addressBookType;
```

---

## UC11 – Allow Person to Belong to Multiple Types

To normalize the database, separate tables are created.

### AddressBookType

```sql
CREATE TABLE AddressBookType(
 typeId INT AUTO_INCREMENT PRIMARY KEY,
 typeName VARCHAR(50)
);
```

### ContactTypeMapping

```sql
CREATE TABLE ContactTypeMapping(
 contactId INT,
 typeId INT,
 PRIMARY KEY(contactId,typeId),
 FOREIGN KEY(contactId) REFERENCES AddressBook(id),
 FOREIGN KEY(typeId) REFERENCES AddressBookType(typeId)
);
```

---

## UC12 – ER Diagram

Entities identified:

* AddressBook
* AddressBookType
* ContactTypeMapping

Relationships:

```
AddressBook
   |
   | 1..N
ContactTypeMapping
   |
   | N..1
AddressBookType
```

---

## UC13 – Queries with Normalized Structure

Retrieve contacts:

```sql
SELECT *
FROM AddressBook
WHERE city='Chennai';
```

Count contacts by type:

```sql
SELECT t.typeName, COUNT(*)
FROM AddressBookType t
JOIN ContactTypeMapping m
ON t.typeId=m.typeId
GROUP BY t.typeName;
```

Sort contacts alphabetically:

```sql
SELECT *
FROM AddressBook
ORDER BY firstName;
```

---

# Git Flow Branch Strategy

Each Use Case was implemented using **feature branches**.

Example:

```
feature/uc1-create-database
feature/uc2-create-table
feature/uc3-insert-contacts
feature/uc4-edit-contact
feature/uc5-delete-contact
```

Features were merged using:

```
git flow feature finish -k <branch-name>
```

---

# How to Run the Project

1. Clone the repository

```
git clone <repository-url>
```

2. Open **MySQL Workbench**

3. Run SQL files in order:

```
UC1 → UC13
```

4. Verify results using `SELECT` queries.

---

# Author

Kartikeya Pusapati
BridgeLabz Fellowship
