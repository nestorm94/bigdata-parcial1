DROP TABLE IF EXISTS classic_estrella.products;

CREATE TABLE classic_estrella.products (
  products_id int NOT NULL,
  productCode varchar(15) NOT NULL,
  productName varchar(70) NOT NULL,
  productLine varchar(50) NOT NULL,
  productScale varchar(10) NOT NULL,
  productVendor varchar(50) NOT NULL,
  productDescription text NOT NULL,
  quantityInStock smallint NOT NULL,
  buyPrice decimal(10,2) NOT NULL,
  MSRP decimal(10,2) NOT NULL,
  detalle_productLine varchar(50) DEFAULT NULL,
  textDescription varchar(4000) DEFAULT NULL,
  htmlDescription varchar(4000) DEFAULT NULL,
  image varchar(4000) DEFAULT NULL,
  PRIMARY KEY (products_id)
)