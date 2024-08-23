create database prodata;
use prodata;


-- Q.1 Write a query to retrieve all the data from the Airlines table.
select * from airlines;


-- Q.2 Retrieve all records where the year is 2015.
select * from  airlines
where year = 2015;


-- Q.3 How many records are there in the Airlines table?
select count(*) from airlines;


-- Q.4 Retrieve only the AIRLINE_NAME and PASSENGERS_TO_INDIA columns.
select AIRLINE_NAME, PASSENGERS_TO_INDIA from Airlines;

-- Q.5 Retrieve all records for the airline "INDIGO".
select * from Airlines where AIRLINE_NAME = 'INDIGO';

-- Q.6 What is the total number of passengers who traveled to India?
select sum(passengers_to_india) from airlines;

-- Q.7 Get the total number of passengers to India for each airline.
SELECT AIRLINE_NAME, SUM(PASSENGERS_TO_INDIA) AS Total_Passengers_To_India 
FROM Airlines 
GROUP BY AIRLINE_NAME;

-- Q.8  Retrieve records for airlines that had more than 100,000 passengers to India in the year 2015.
select * from airlines 
where year = 2015 and passengers_to_india > 100000;

-- Q.9 List the airlines in descending order of the total freight sent to India.
SELECT AIRLINE_NAME, SUM(FREIGHT_TO_INDIA) AS Total_Freight_To_India 
FROM Airlines 
GROUP BY AIRLINE_NAME 
ORDER BY Total_Freight_To_India DESC;

-- Q.10 Calculate the difference between passengers traveling to and from India for each airline.
SELECT AIRLINE_NAME, (PASSENGERS_TO_INDIA - PASSENGERS_FROM_INDIA) AS Passenger_Difference FROM Airlines; 