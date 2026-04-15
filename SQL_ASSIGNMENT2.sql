use mohit_assignment;
-- Display product name, quantity produced, production cost, and cost per unit (production_cost / quantity_produced). Alias as cost_per_unit.
Select t1.product_name,t1.quantity_produced,t1.production_cost,(t1.production_cost/t1.quantity_produced) as cost_per_unit from production t1;

-- Show product name, production date, and extract the year from production date. Alias as production_year.
Select t1.product_name,t1.production_date,year(t1.production_date) from production t1;

-- Display product name and production cost along with 10% increased cost (production_cost + 10%). Alias as estimated_future_cost.
Select t1.product_name,t1.production_cost,(t1.production_cost + (t1.production_cost/10)) as estimated_future_cost from production t1;

-- Show product name, quantity produced, production cost, and total production value (quantity_produced × production_cost). Alias as production_value.
Select t1.product_name,t1.quantity_produced,t1.production_cost,(t1.production_cost*t1.quantity_produced) as production_value from production t1;

-- Display production_id, quantity produced, and remaining capacity assuming factory daily capacity is 250 units (250 - quantity_produced). Alias as remaining_capacity.
Select t1.production_id,t1.quantity_produced,(250 - t1.quantity_produced) as remaining_capacity from production t1;

-- Find the total quantity produced across all factories.
Select SUm(t1.quantity_produced) as total_quantity from production t1 Where t1.factory_id is not null;

-- Find the average production cost of all products.
Select AVG(t1.production_cost) as Avg_production_cost from production t1;

-- Find the maximum and minimum quantity produced.
Select MAx(t1.quantity_produced) as Maximum,min(t1.quantity_produced) as Minimum from production t1;

-- Count how many production records exist for Night shift.
Select Count(*) as production_records from production t1 Where t1.shift='Night';

-- Find the total number of distinct products manufactured.
Select count(Distinct (t1.product_name)) as distinct_production_records from production t1 ;

-- Find total quantity produced per product.
Select SUM(t1.quantity_produced) as total_quantity,t1.product_name from production t1 group by t1.product_name;

-- Find total production cost per factory (show factory name).
Select SUM(t1.production_cost) as production_cost,t2.factory_name from production t1 inner join factory t2 on t1.factory_id=t2.factory_id group by t2.factory_name;

-- Show average quantity produced per shift.
Select Avg(t1.quantity_produced) as avg_quantity,t1.shift from production t1 group by t1.shift;

-- Find number of production records per factory (display factory name and count).
Select COUNT(t1.factory_id) as production_cost,t2.factory_name from production t1 inner join factory t2 on t1.factory_id=t2.factory_id group by t2.factory_name;

-- For each product, calculate total quantity, average cost, and total cost.
Select t1.product_name,SUM(t1.quantity_produced) as Total_qty,AVG(t1.production_cost) as average_cost,SUM(t1.production_cost) as total_cost from production t1 group by t1.product_name;

-- List total quantity produced by each factory sorted in descending order.
Select SUM(t1.quantity_produced) as quanity_produced,t2.factory_name from production t1 inner join factory t2 on t1.factory_id=t2.factory_id group by t2.factory_name order by SUM(t1.quantity_produced) desc;

-- Display factories with their total production cost sorted from highest to lowest.
Select SUM(t1.production_cost) as production_cost,t2.factory_name from production t1 inner join factory t2 on t1.factory_id=t2.factory_id group by t2.factory_name order by SUM(t1.production_cost) desc;

-- Find top 3 products based on total quantity produced.
Select t1.product_name,SUM(t1.quantity_produced) from production t1  group by t1.product_name Order by SUM(t1.quantity_produced) desc Limit 3;

-- Show bottom 5 production records based on production cost using ORDER BY and LIMIT.
Select t1.* From production t1 order by t1.production_cost asc Limit 5;

-- Display factory name, product name, and production cost for all records sorted by factory name and production cost.
Select t2.factory_name,t1.product_name,t1.production_cost from production t1 inner join factory t2 on t1.factory_id=t2.factory_id order by t2.factory_name,t1.production_cost ;
