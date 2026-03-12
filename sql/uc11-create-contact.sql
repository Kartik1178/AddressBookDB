CREATE TABLE ContactTypeMapping (
    contactId INT,
    typeId INT,
    PRIMARY KEY(contactId,typeId),
    FOREIGN KEY(contactId) REFERENCES AddressBook(id),
    FOREIGN KEY(typeId) REFERENCES AddressBookType(typeId)
);