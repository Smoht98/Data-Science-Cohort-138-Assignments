use mohit_assignment;

CREATE TABLE factory (
  factory_id INT PRIMARY KEY,
  factory_name VARCHAR(100),
   location VARCHAR(50),
   manager_name VARCHAR(50)
);

INSERT INTO factory VALUES
(1, 'Alpha Manufacturing', 'Pune', 'Rajesh Kumar'),
(2, 'Beta Industries', 'Chennai', 'Suresh Iyer'),
(3, 'Gamma Works', 'Bangalore', 'Anita Sharma'),
(4, 'Delta Corp', 'Hyderabad', 'Ravi Verma'),
(5, 'Omega Manufacturing', 'Ahmedabad', 'Neha Patel');


CREATE TABLE production (
production_id INT PRIMARY KEY,
factory_id INT,
product_name VARCHAR(50),
quantity_produced INT,
production_cost DECIMAL(10,2),
production_date DATE,
shift VARCHAR(10),
FOREIGN KEY (factory_id) REFERENCES factory(factory_id)
);

INSERT INTO production VALUES
(1, 1, 'Gear Box', 120, 45000, '2025-01-01', 'Day'),
(2, 1, 'Engine Part', 90, 72000, '2025-01-02', 'Night'),
(3, 2, 'Brake Pad', 200, 30000, '2025-01-03', 'Day'),
(4, 2, 'Clutch Plate', 150, 55000, '2025-01-04', 'Night'),
(5, 3, 'Axle Rod', 80, 40000, '2025-01-05', 'Day'),
(6, 3, 'Gear Box', 110, 46000, '2025-01-06', 'Night'),
(7, 4, 'Piston', 130, 60000, '2025-01-07', 'Day'),
(8, 4, 'Cylinder', 95, 52000, '2025-01-08', 'Night'),
(9, 5, 'Engine Block', 70, 90000, '2025-01-09', 'Day'),
(10, 5, 'Crank Shaft', 60, 85000, '2025-01-10', 'Night'),
(11, 1, 'Brake Pad', 210, 31000, '2025-01-11', 'Day'),
(12, 2, 'Gear Box', 140, 47000, '2025-01-12', 'Night'),
(13, 3, 'Piston', 125, 61000, '2025-01-13', 'Day'),
(14, 4, 'Clutch Plate', 155, 56000, '2025-01-14', 'Night'),
(15, 5, 'Axle Rod', 100, 42000, '2025-01-15', 'Day'),
(16, 1, 'Cylinder', 85, 50000, '2025-01-16', 'Night'),
(17, 2, 'Engine Part', 95, 74000, '2025-01-17', 'Day'),
(18, 3, 'Brake Pad', 220, 33000, '2025-01-18', 'Night'),
(19, 4, 'Gear Box', 115, 48000, '2025-01-19', 'Day'),
(20, 5, 'Piston', 105, 62000, '2025-01-20', 'Night');

-- Display all records from the production table.
Select * FROM production;

-- Show only product\_name and quantity\_produced.
Select product_name,quantity_produced from production;

-- Find products where quantity produced is greater than 150.
Select product_name,quantity_produced from production Where quantity_produced > 120;

-- Fetch records where production cost is less than 50,000.
Select * FROM production where production_cost < 50000;

-- Show products with quantity between 80 and 120.
Select product_name from production where quantity_produced between 80 and 120;

-- Get records where product name is Gear Box.
Select * From production where product_name ='Gear Box';

-- Display all records from Day shift.
Select * From production where shift='Day';

-- Find products manufactured in Night shift.
Select product_name From production where shift ='night';

-- Display distinct product names.
Select distinct product_name from production;

-- Display distinct shift values.
Select distinct shift from production;

-- Sort records by production cost (ascending).
Select * From production order by production_cost asc;

-- Sort records by quantity produced (descending).
Select * From production order by quantity_produced desc;

-- Sort by production date latest first.
Select * From production order by production_date desc limit 5; 

-- Display first 5 records.
SELECT * FROM production limit 5;

-- Display top 3 highest production quantities.
Select quantity_produced from production order by quantity_produced desc limit 3 ;

-- Display 5 records starting from 6th row.
SELECT * FROM production limit 5 offset 5;

-- Display production details along with factory name.
Select t1.*,t2.factory_name From production t1 inner join factory t2 on t1.factory_id=t2.factory_id;

-- Show factory name and total quantity produced.
Select SUM(t1.quantity_produced),t2.factory_name From production t1 inner join factory t2 on t1.factory_id=t2.factory_id group by t2.factory_name;

-- List all products manufactured in Pun
Select t1.product_name From production t1 inner join factory t2 on t1.factory_id=t2.factory_id Where t2.location = 'Pune';

-- Show factory-wise production cost greater than 60,000.
Select t2.factory_name,SUM(t1.production_cost) From production t1 inner join factory t2 on t1.factory_id=t2.factory_id  Group by t2.factory_name Having SUM(t1.production_cost) > 60000;

-- Fetch the top 5 most expensive products manufactured in Day shift, along with:
Select t2.factory_name,t1.product_name,t1.production_cost From production t1 inner join factory t2 on t1.factory_id=t2.factory_id  where t1.shift='Day' Order by t1.production_cost desc limit 5;

-- Display distinct product names that are manufactured in Bangalore or Pune factories.
Select distinct t1.product_name From production t1 inner join factory t2 on t1.factory_id=t2.factory_id where t2.location in ('Pune','Bangalore');

-- Retrieve the 3rd to 7th highest quantity produced products, showing:
Select t1.product_name,t1.quantity_produced,t2.factory_name From production t1 inner join factory t2 on t1.factory_id=t2.factory_id   Order by t1.quantity_produced desc limit 5 offset 2;

-- List all products where production cost is between 40,000 and 70,000 shift is Night factory is located in Hyderabad or Chennai
Select t2.factory_name,t1.product_name,t1.production_cost From production t1 inner join factory t2 on t1.factory_id=t2.factory_id Where t1.shift ='Night' and t1.production_cost between 40000 and 70000 and t2.location in ('Hyderabad','Chennai');

-- From all factories, fetch factory name ,product name, quantity produced,
Select t2.factory_name,t1.product_name,t1.quantity_produced From production t1 inner join factory t2 on t1.factory_id=t2.factory_id where t1.quantity_produced >100 and t1.product_name <> 'Brake Pad' Order by factory_name asc ,quantity_produced desc













