CREATE DATABASE EcommerceSalesDelivery;
GO
USE EcommerceSalesDelivery;
GO

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(20),
    age INT,
    city VARCHAR(100),
    state VARCHAR(100),
    region VARCHAR(50),
    customer_segment VARCHAR(50),
    signup_date DATE
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    brand VARCHAR(100),
    unit_cost DECIMAL(12,2),
    supplier VARCHAR(100),
    product_rating DECIMAL(3,1),
    list_price DECIMAL(12,2)
);

CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100),
    seller_region VARCHAR(50),
    seller_rating DECIMAL(3,1),
    seller_type VARCHAR(50),
    commission_rate DECIMAL(5,3)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT,
    seller_id INT,
    quantity INT,
    discount_pct DECIMAL(6,3),
    shipping_fee DECIMAL(12,2),
    shipping_date DATE,
    delivery_date DATE,
    delivery_days INT,
    order_status VARCHAR(30),
    sales_channel VARCHAR(50),
    delivery_partner VARCHAR(50),
    unit_price DECIMAL(12,2),
    gross_sales DECIMAL(14,2),
    discount_amount DECIMAL(14,2),
    net_sales DECIMAL(14,2),
    estimated_cost DECIMAL(14,2),
    profit DECIMAL(14,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT UNIQUE,
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(30),
    amount_paid DECIMAL(14,2),
    transaction_fee DECIMAL(12,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT UNIQUE,
    dispatch_date DATE,
    promised_days INT,
    promised_delivery_date DATE,
    actual_delivery_date DATE,
    actual_delivery_days INT,
    delivery_status VARCHAR(30),
    delivery_partner VARCHAR(50),
    delivery_cost DECIMAL(12,2),
    distance_km INT,
    attempt_count INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Date_Dimension (
    date DATE PRIMARY KEY,
    year INT,
    quarter VARCHAR(5),
    month_number INT,
    month_name VARCHAR(20),
    month_short VARCHAR(5),
    week_number INT,
    day_name VARCHAR(20),
    is_weekend BIT
);


select * from [dbo].[Customers]
select * from [dbo].[Date_Dimension]
select * from [dbo].[Deliveries]
select * from [dbo].[Orders]
select * from [dbo].[Payments]
select * from [dbo].[Products]
select * from [dbo].[Sellers]




SELECT 
    @@VERSION AS SQLServerVersion;

SELECT 
    SERVERPROPERTY('ProductVersion') AS ProductVersion,
    SERVERPROPERTY('ProductLevel') AS ProductLevel,
    SERVERPROPERTY('Edition') AS Edition;






