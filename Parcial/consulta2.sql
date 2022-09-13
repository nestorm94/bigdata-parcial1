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
    employeeNumber,lastName, firstName
FROM classic_estrella.orders a 
inner JOIN classic_estrella.products b on a.detalle_productCode = b.productCode 
inner join classic_estrella.employees c on a.customerNumber = c.customerNumber
GROUP BY Trimestre ORDER BY fecha;