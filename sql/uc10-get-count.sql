SELECT addressBookType, COUNT(*) AS totalContacts
FROM AddressBook
GROUP BY addressBookType;