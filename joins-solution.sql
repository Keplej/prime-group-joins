-- ## Tasks

-- 1. Get all customers and their addresses.
SELECT * FROM addresses
JOIN customers ON addresses.customer_id = customers.id;

-- 2. Get all orders and their line items (orders, quantity and product).


-- 3. Which warehouses have cheetos?
SELECT products.description, warehouse.warehouse FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse.id = warehouse_product.warehouse_id;

-- DELTA has the cheetos

-- 4. Which warehouses have diet pepsi?
SELECT products.description, warehouse.warehouse FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse.id = warehouse_product.warehouse_id;

-- ALPHA, DELTA, and GAMMA has the diet pepsi

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

-- 6. How many customers do we have?
SELECT * FROM customers;

-- 4
SELECT COUNT(customers.id) FROM customers;
-- This is how we should do it ^^^^


-- 7. How many products do we carry?

SELECT COUNT(products.id) FROM products;
-- 7

-- 8. What is the total available on-hand quantity of diet pepsi?



-- Add some people
INSERT INTO person (id, first_name, last_name) VALUES
(10000, 'Mary', 'Mosman'),-- 10000 Mary
(10001, 'Johnny', 'Keple'), -- 10001 Johnny
(10002, 'Charlie', 'Stokes'),
(10003, 'John', 'Takos'),
(10004, 'Sam', 'Moudry'),
(10005, 'Chloe', 'Everson'),
(10006, 'Robyn', 'Noble');
-- Add some hobbies
INSERT INTO hobby (id, description) VALUES 
(1000, 'fitness'),
(1001, 'gaming'),
(1002, 'dancing'),
(1003, 'biking'),
(1004, 'board games');
-- Connet them up
INSERT INTO person_hobby (person_id, hobby_id, skill_level) VALUES
(10000, 1000, 1),
(10000, 1001, 5),
(10000, 1002, 3),
(10001, 1000, 5),
(10002, 1001, 1),
(10003, 1001, 8),
(10004, 1001, 7),
(10004, 1002, 9),
(10005, 1002, 6),
(10005, 1003, 7),
(10006, 1002, 10),
(10006, 1004, 10);
-- TODO GET all the information about people & their hobbies
-- hint: start by getting all the hobby, the start joining & get skill level, then add the person info
SELECT person.first_name, person.last_name, hobby.description, ph.skill_level FROM hobby
JOIN person_hobby ph ON hobby.id = ph.hobby_id
JOIN person ON person.id = ph.person_id
WHERE person.id=10000
ORDER BY person.first_name;
-- How many hobbies does mary have
SELECT COUNT(*) FROM person
JOIN person_hobby ph ON person.id = ph.person_id
WHERE person.id = 10000;
-- What is the max dance skill?
-- Many aggregate function MAX, MIN, AVG, SUM, COUNT
SELECT MAX(skill_level) as max_danace_skill FROM person_hobby as ph
JOIN hobby ON hobby.id = ph.hobby_id
WHERE hobby.description = 'dancing';
-- What is the average dance skill?
SELECT AVG(skill_level) as avg_dance_skill FROM person_hobby as ph
JOIN hobby ON hobby.id = ph.hobby_id
WHERE hobby.description = 'dancing';
-- What is the average skill for all hobbies?
SELECT hobby.description, AVG(skill_level) as avg_skill FROM person_hobby as ph
JOIN hobby ON hobby.id = ph.hobby_id
GROUP BY hobby.id;
