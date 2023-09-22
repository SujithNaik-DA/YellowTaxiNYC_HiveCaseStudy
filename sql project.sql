create database hive;
use hive;

show tables;
select * from tripdata;


-- qs1 What is the total Number of trips (equal to number of rows)? 
select count(*) from tripdata;


-- qs2 What is the total revenue generated by all the trips? 

Select sum(total_amount) as total_revenue from tripdata;

-- qs3 What fraction of the total is paid for tolls? 

Select sum(tolls_amount)/sum(total_amount) as toll_pct from tripdata;

-- qs4 What fraction of it is driver tips? 

Select sum(tip_amount)/sum(total_amount) as tip_pct from tripdata;

-- qs5 What is the average trip amount?

Select avg(total_amount) as avg_tripamount from tripdata;

-- qs6 For each payment type, display the following details:
-- i.	Average fare generated 
-- ii.	Average tip 
-- iii.	Average tax


select payment_type, 
avg(fare_amount) as average_fare,
avg(tip_amount) as average_tip,
avg(mta_tax) as average_tax
from tripdata
group by payment_type;



-- qs7 On an average which hour of the day generates the highest revenue?

select h24 as hour, 
avg(total_amount) as avg_revenue 
from (select hour(tpep_pickup_datetime) as h24, 
      total_amount 
from tripdata) ff 
group by h24
order by avg_revenue desc;


-- qs8 What is the average distance of the trips?

select 
avg(trip_distance) as avg_distance 
from tripdata;

-- qs9 How many different payment types are used?

select distinct payment_type from tripdata;
