INSERT INTO classic_estrella.products(
productCode, 
productName, 
productLine, 
productScale, 
productVendor, 
productDescription, 
quantityInStock, 
buyPrice, 
MSRP, 
detalle_productLine, 
textDescription, 
htmlDescription, 
image
)
SELECT 
a.productCode,
a.productName,
a.productline,
a.productScale,
a.productVendor,
a.productDescription,
a.quantityInStock,
a.buyPrice,
a.MSRP,
b.productLine,
b.textDescription, 
b.htmlDescription,
b.image 
FROM classic_model.products a inner join classic_model.productlines b 
        ON  a.productLine = b.productLine;

