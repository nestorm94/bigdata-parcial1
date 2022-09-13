INSERT INTO classic_estrella.orders(orderNumber,orderDate,requiredDate, shippedDate, 
			orders.status, comments, customerNumber, 
            detalle_orderNumber, detalle_productCode,
            detelle_quantityOrdered, detalle_priceEach, detalle_orderLineNumber)    
SELECT  a.orderNumber, a.orderDate, a.requiredDate, a.shippedDate, a.status, a.comments, a.customerNumber,
		 b.orderNumber, b.productCode, b.quantityOrdered, b.priceEach, b.orderLineNumber
        FROM classic_model.orders a inner join classic_model.orderdetails b 
        ON  a.orderNumber =   b.orderNumber;

