USE EO_AdventureWorksDW2019

go

-- Drop foregin Keys if exists
IF EXISTS (SELECT * FROM   sys.foreign_keys WHERE  NAME = 'fk_fact_sales_dim_customer' AND parent_object_id = Object_id('fact_sales'))

ALTER TABLE fact_sales
    DROP CONSTRAINT fk_fact_sales_dim_customer;

-- Drop and create the table
IF EXISTS (SELECT * FROM   sys.tables WHERE  NAME = 'dim_customer')
  DROP TABLE dim_customer

go

CREATE TABLE dim_customer
  (
     customer_key       INT NOT NULL IDENTITY(1, 1),
     customer_id        INT NOT NULL,
     customer_name      NVARCHAR(150),
     address1           NVARCHAR(100),
     address2           NVARCHAR(100),
     city               NVARCHAR(30),
     phone              NVARCHAR(25),
     source_system_code TINYINT NOT NULL,
     start_date         DATETIME NOT NULL DEFAULT (Getdate()),
     end_date           DATETIME NULL,
     is_current         TINYINT NOT NULL DEFAULT (1),

     CONSTRAINT pk_dim_customer PRIMARY KEY CLUSTERED (customer_key)
  );

-- Create Foreign Keys
IF EXISTS (SELECT * FROM   sys.tables WHERE  NAME = 'fact_sales' AND type = 'u')
  
ALTER TABLE fact_sales
ADD CONSTRAINT fk_fact_sales_dim_customer FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key);

-- Create Indexes
IF EXISTS (SELECT * FROM   sys.indexes WHERE  NAME = 'dim_customer_customer_id' AND object_id = Object_id('dim_customer'))
DROP INDEX dim_customer.dim_customer_customer_id

go

CREATE INDEX dim_customer_customer_id ON dim_customer(customer_id);

IF EXISTS (SELECT * FROM   sys.indexes WHERE  NAME = 'dim_customer_city' AND object_id = Object_id('dim_customer'))
DROP INDEX dim_customer.dim_customer_city

go

CREATE INDEX dim_customer_city ON dim_customer(city); 
