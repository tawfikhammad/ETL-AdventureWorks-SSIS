USE AdventureWorksDW2019
go 

IF EXISTS (SELECT * 
           FROM   sys.tables 
           WHERE  NAME = 'CountryName') 
  DROP TABLE sales.CountryName; 

CREATE TABLE sales.CountryName 
  (  country_code   NVARCHAR(2) NOT NULL,
	 counttry_name  NVARCHAR(50) NOT NULL); 

INSERT INTO sales.CountryName 
            (country_code,
			counttry_name) 
VALUES      ('US', 'United States'), 
            ('CA', 'Canada'), 
            ('FR', 'France'), 
            ('DE', 'Germany'), 
            ('AU', 'Australia'), 
            ('GB', 'United Kingdom'); 