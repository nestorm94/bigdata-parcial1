

INSERT INTO classic_estrella.employees( employeeNumber, lastName, 
firstName, extension, email, officeCode, reportsTo, jobTitle, city, phone, addressLine1, 
addressLine2, state, country, postalCode, territory,
salesRepEmployeeNumber, customerNumber, customerName, contactLastName, contactFirstName)    
SELECT  b.employeeNumber,
b.lastName,
b.firstName,
b.extension,
b.email,
b.officeCode,
b.reportsTo,
b.jobTitle,
a.city,
a.phone,
a.addressLine1,
a.addressLine2,
a.state,
a.country,
a.postalCode,
a.territory, c.salesRepEmployeeNumber, c.customerNumber, c.customerName, c.contactLastName, c.contactFirstName
        FROM classic_model.offices a inner join classic_model.employees b ON  a.officeCode = b.officeCode
        inner join classic_model.customers c on  b.employeeNumber = c.salesRepEmployeeNumber;