SELECT orderDate AS fecha,
        year(a.orderDate)AS Año,
        (CASE 
    WHEN MONTH(a.orderDate) IN (1,2,3) THEN
    1 
    WHEN MONTH(a.orderDate) IN (4,5,6) THEN
    2 
    WHEN MONTH(a.orderDate) IN (7,8,9) THEN
    3 
    WHEN MONTH(a.orderDate) IN (10,11,12) THEN
    4  END) Trimestre, 
    SUM(detalle_priceEach) total_mes,
    a.customerNumber,a.orderNumber,a.detalle_productCode, b.productName, 
    b.productLine, b.productScale, b.productVendor, b.productDescription, 
    b.quantityInStock, b.buyPrice, b.MSRP, b.detalle_productLine, b.textDescription 
FROM classic_estrella.orders a inner JOIN classic_estrella.products b 
WHERE a.detalle_productCode = b.productCode 
GROUP BY Trimestre ORDER BY fecha;