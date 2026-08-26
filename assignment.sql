SELECT INVENTORY.SKU, 
    INVENTORY.SKU_Description, 
    INVENTORY.WarehouseID, 
    WAREHOUSE.WarehouseCity, 
    WAREHOUSE.WarehouseState
FROM INVENTORY
JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE WarehouseCity = 'Atlanta'
   OR WarehouseCity = 'Bangor'
   OR WarehouseCity = 'Chicago';
   
  --  2.41
  SELECT INVENTORY.SKU,
  INVENTORY.SKU_Description,
  INVENTORY.WarehouseID,
  WarehouseCity, WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
AND WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');
  
 --  2.42
 SELECT INVENTORY.SKU,
 INVENTORY.SKU_Description,
 INVENTORY.WarehouseID,
 WarehouseCity, WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
AND WarehouseCity <> 'Atlanta'
AND WarehouseCity <> 'Bangor'
AND WarehouseCity <> 'Chicago';

-- 2.43
SELECT INVENTORY.SKU,
       INVENTORY.SKU_Description,
       INVENTORY.WarehouseID,
       WAREHOUSE.WarehouseCity,
       WAREHOUSE.WarehouseState
FROM INVENTORY
JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.44
SELECT CONCAT(INVENTORY.SKU_Description, ' is located in ', WAREHOUSE.WarehouseCity)AS ItemLocation
FROM INVENTORY
JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID;

-- 2.45
SELECT WarehouseID
FROM WAREHOUSE
WHERE Manager = 'Lucille Smith';

SELECT INVENTORY.SKU,
       INVENTORY.SKU_Description,
       INVENTORY.WarehouseID
FROM INVENTORY
WHERE WarehouseID = (
    SELECT WarehouseID
    FROM WAREHOUSE
    WHERE Manager = 'Lucille Smith'
);
-- 2.46
SELECT INVENTORY.SKU,
       INVENTORY.SKU_Description,
       INVENTORY.WarehouseID
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
  AND WAREHOUSE.Manager = 'Lucille Smith';
 --  2.47
 SELECT INVENTORY.SKU,
       INVENTORY.SKU_Description,
       INVENTORY.WarehouseID
FROM INVENTORY
JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE WAREHOUSE.Manager = 'Lucille Smith';
-- 2.48
SELECT WarehouseID,
       AVG(QuantityOnHand) AS AverageQuantityOnHand
FROM INVENTORY
WHERE WarehouseID = (
    SELECT WarehouseID
    FROM WAREHOUSE
    WHERE Manager = 'Lucille Smith'
)
GROUP BY WarehouseID;
-- 2.49
SELECT INVENTORY.WarehouseID,
       AVG(INVENTORY.QuantityOnHand) AS AverageQuantityOnHand
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
  AND WAREHOUSE.Manager = 'Lucille Smith'
GROUP BY INVENTORY.WarehouseID;
-- 2.50
SELECT INVENTORY.WarehouseID,
       AVG(INVENTORY.QuantityOnHand) AS AverageQuantityOnHand
FROM INVENTORY
JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE WAREHOUSE.Manager = 'Lucille Smith'
GROUP BY INVENTORY.WarehouseID;
-- 2.51
SELECT WAREHOUSE.WarehouseID,
       WAREHOUSE.WarehouseCity,
       WAREHOUSE.WarehouseState,
       WAREHOUSE.Manager,
       INVENTORY.SKU,
       INVENTORY.SKU_Description,
       INVENTORY.QuantityOnHand
FROM WAREHOUSE
JOIN INVENTORY
ON WAREHOUSE.WarehouseID = INVENTORY.WarehouseID
WHERE WAREHOUSE.Manager = 'Lucille Smith';
-- 2.52
SELECT INVENTORY.WarehouseID,
       QuantityOnOrder,
       SUM(QuantityOnOrder) AS TotalItemsOnOrder,
       SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID, QuantityOnOrder;
-- 2.53
