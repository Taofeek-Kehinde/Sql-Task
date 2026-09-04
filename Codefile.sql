SELECT SKU, SKU_Description FROM INVENTORY; 

SELECT SKU_Description, SKU FROM INVENTORY; 

SELECT WarehouseID FROM INVENTORY;


SELECT WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder FROM INVENTORY;

SELECT * FROM INVENTORY;

SELECT * FROM INVENTORY WHERE QuantityOnHand > 0;


SELECT  SKU, SKU_Description FROM INVENTORY WHERE QuantityOnHand = 0;

SELECT SKU, SKU_Description, WarehouseID 
FROM INVENTORY WHERE QuantityOnHand = 0 ORDER BY WarehouseID ASC;

SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE
 QuantityOnHand > 0 ORDER BY WarehouseID DESC;
 
 SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE
 QuantityOnHand = 0 AND QuantityOnHand > 0 ORDER BY WarehouseID DESC, SKU ASC;
 
 SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0 ORDER BY WarehouseID DESC, SKU ASC;
 

 SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand FROM INVENTORY WHERE QuantityOnHand > 1 And QuantityOnHand < 10;
 
  SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand FROM INVENTORY WHERE QuantityOnHand BETWEEN 2 AND 9;
  
  
 SELECT DISTINCT SKU, SKU_Description FROM INVENTORY WHERE SKU_Description LIKE 'Half-Dome%';
 
 SELECT DISTINCT SKU, SKU_Description FROM INVENTORY WHERE SKU_Description LIKE '%Climb%';
 SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '__d%';

 SELECT 
    COUNT(QuantityOnHand) AS TotalRowsWithData,
    SUM(QuantityOnHand) AS TotalQuantity,
    AVG(QuantityOnHand) AS AverageQuantity,
    MIN(QuantityOnHand) AS MinimumQuantity,
    MAX(QuantityOnHand) AS MaximumQuantity
FROM INVENTORY;

-- COUNT: Counts the rows. It tells you how many entries exist in a column, regardless of their value. -- 
-- SUM: Calculates the mathematical total. It adds the actual values together. It can only be used on numerical columns.-- 

SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandLT3 DESC;

SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY	
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
HAVING COUNT(DISTINCT SKU) < 2
ORDER BY TotalItemsOnHandLT3 DESC;


-- The database looks at the raw PRODUCT table and evaluates WHERE QuantityOnHand < 3. It immediately discards any row where a product has 3 or more items on hand. Grouping has not happened yet.-- 



