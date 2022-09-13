CREATE TABLE classic_estrella."dimension_tiempo"
(
iddimension_tiempo INT NOT NULL ,
  fecha DATE NULL DEFAULT NULL,
  ano INT NULL DEFAULT NULL,
  mes INT NULL DEFAULT NULL,
  PRIMARY KEY (iddimension_tiempo));




CREATE TABLE classic_estrella."employees" (
  employees_id INT NOT NULL ,
  employeeNumber INT NOT NULL,
  lastName VARCHAR(50) NOT NULL,
  firstName VARCHAR(50) NOT NULL,
  extension VARCHAR(10) NOT NULL,
  email VARCHAR(100) NOT NULL,
  officeCode VARCHAR(10) NOT NULL,
  reportsTo INT NULL DEFAULT NULL,
  jobTitle VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  addressLine1 VARCHAR(50) NOT NULL,
  addressLine2 VARCHAR(50) NULL DEFAULT NULL,
  state VARCHAR(50) NULL DEFAULT NULL,
  country VARCHAR(50) NOT NULL,
  postalCode VARCHAR(15) NOT NULL,
  territory VARCHAR(10) NOT NULL,
  PRIMARY KEY (employees_id));


CREATE TABLE classic_estrella."orders" (
  orders_id INT NOT NULL ,
  orderNumber INT NOT NULL,
  orderDate DATE NOT NULL,
  requiredDate DATE NOT NULL,
  shippedDate DATE NULL DEFAULT NULL,
  status VARCHAR(15) NOT NULL,
  comments TEXT NULL DEFAULT NULL,
  customerNumber INT NOT NULL,
  detalle_orderNumber INT NOT NULL,
  detalle_productCode VARCHAR(15) NOT NULL,
  detelle_quantityOrdered INT NOT NULL,
  detalle_priceEach DECIMAL(10,2) NOT NULL,
  detalle_orderLineNumber SMALLINT NOT NULL,
  PRIMARY KEY (orders_id))



CREATE TABLE classic_estrella."products" (
  productCode VARCHAR(15) NOT NULL,
  productName VARCHAR(70) NOT NULL,
  productLine VARCHAR(50) NOT NULL,
  productScale VARCHAR(10) NOT NULL,
  productVendor VARCHAR(50) NOT NULL,
  productDescription TEXT NOT NULL,
  quantityInStock SMALLINT NOT NULL,
  buyPrice DECIMAL(10,2) NOT NULL,
  MSRP DECIMAL(10,2) NOT NULL,
  detalle_productLine VARCHAR(50) NULL DEFAULT NULL,
  textDescription VARCHAR(4000) NULL DEFAULT NULL,
  htmlDescription VARCHAR(4000) NULL DEFAULT NULL,
  image VARCHAR(4000) NULL DEFAULT NULL,
  products_id INT NOT NULL ,
  PRIMARY KEY (products_id))


CREATE TABLE  classic_estrella."Venta" (
  idVenta INT NOT NULL ,
  Unidades VARCHAR(45) NOT NULL,
  orders_orders_id INT NOT NULL,
  employees_employees_id INT NOT NULL,
  products_products_id INT NOT NULL,
  dimension_tiempo_iddimension_tiempo INT NOT NULL,
  PRIMARY KEY (idVenta))


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
AUTHORIZATION admin2;