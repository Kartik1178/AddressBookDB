SELECT city, COUNT(*) AS contactCount
FROM AddressBook
GROUP BY city;

SELECT state, COUNT(*) AS contactCount
FROM AddressBook
GROUP BY state;