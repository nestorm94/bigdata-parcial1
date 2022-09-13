insert into classic_estrella.dimension_tiempo(fecha, ano, mes) 
SELECT 
orderDate as fecha,
year(orderDate)as Año,
(CASE
  WHEN MONTH(orderDate) IN (1,3) THEN 1
  WHEN MONTH(orderDate) IN (4,6) THEN 2
  WHEN MONTH(orderDate) IN (7,9) THEN 3
  WHEN MONTH(orderDate) IN (10,12) THEN 4
  END) Trimestre,
  SUM(detalle_priceEach) total_mes
FROM classic_estrella.orders 
GROUP BY Trimestre;
