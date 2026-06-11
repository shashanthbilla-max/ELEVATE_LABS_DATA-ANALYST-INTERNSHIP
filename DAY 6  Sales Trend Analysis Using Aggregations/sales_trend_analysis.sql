CREATE TABLE online_sales (
    InvoiceNo BIGINT,
    StockCode VARCHAR(50),
    Description TEXT,
    Quantity INT,
    InvoiceDate TIMESTAMP,
    UnitPrice NUMERIC(10,2),
    CustomerID NUMERIC,
    Country VARCHAR(100),
    Discount NUMERIC(10,2),
    PaymentMethod VARCHAR(50),
    ShippingCost NUMERIC(10,2),
    Category VARCHAR(100),
    SalesChannel VARCHAR(50),
    ReturnStatus VARCHAR(50),
    ShipmentProvider VARCHAR(100),
    WarehouseLocation VARCHAR(100),
    OrderPriority VARCHAR(50)
);


select * from online_sales;


//Monthly Revenue Analysis
SELECT
    EXTRACT(YEAR FROM InvoiceDate) AS year,
    EXTRACT(MONTH FROM InvoiceDate) AS month,
    SUM(Quantity * UnitPrice) AS total_revenue
FROM online_sales
GROUP BY year, month
ORDER BY year, month;


//Monthly Order Volume
SELECT
    EXTRACT(YEAR FROM InvoiceDate) AS year,
    EXTRACT(MONTH FROM InvoiceDate) AS month,
    COUNT(DISTINCT InvoiceNo) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

//Monthly Revenue + Order Volume (Main Query)
SELECT
    EXTRACT(YEAR FROM InvoiceDate) AS year,
    EXTRACT(MONTH FROM InvoiceDate) AS month,
    SUM(Quantity * UnitPrice) AS total_revenue,
    COUNT(DISTINCT InvoiceNo) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

//Revenue for a Specific Year
SELECT
    EXTRACT(MONTH FROM InvoiceDate) AS month,
    SUM(Quantity * UnitPrice) AS revenue
FROM online_sales
WHERE EXTRACT(YEAR FROM InvoiceDate) = 2020
GROUP BY month
ORDER BY month;

//Top 5 Months by Revenue

SELECT
    EXTRACT(YEAR FROM InvoiceDate) AS year,
    EXTRACT(MONTH FROM InvoiceDate) AS month,
    SUM(Quantity * UnitPrice) AS revenue
FROM online_sales
GROUP BY year, month
ORDER BY revenue DESC
LIMIT 5;

//Yearly Revenue Trend

SELECT
    EXTRACT(YEAR FROM InvoiceDate) AS year,
    SUM(Quantity * UnitPrice) AS revenue
FROM online_sales
GROUP BY year
ORDER BY year;

//Average Revenue per Order
SELECT
    ROUND(
        SUM(Quantity * UnitPrice) /
        COUNT(DISTINCT InvoiceNo),
        2
    ) AS avg_order_value
FROM online_sales;

//Highest Revenue Month
SELECT
    EXTRACT(YEAR FROM InvoiceDate) AS year,
    EXTRACT(MONTH FROM InvoiceDate) AS month,
    SUM(Quantity * UnitPrice) AS revenue
FROM online_sales
GROUP BY year, month
ORDER BY revenue DESC
LIMIT 1;

//Product-wise Revenue

SELECT
    StockCode,
    SUM(Quantity * UnitPrice) AS revenue
FROM online_sales
GROUP BY StockCode
ORDER BY revenue DESC;

