select * from financial_data;

SELECT customer_name,amount FROM financial_data;

SELECT * FROM financial_data WHERE amount > 50000;

select * from financial_data where amount between 20000 and 30000;

SELECT * FROM financial_data WHERE category = 'Travel';

select count(*) total_transaction from financial_data;

select * from financial_data where payment_method='upi';

SELECT MAX(amount) AS highest_amount FROM financial_data;

select min(amount) as lowest_amount from financial_data;

select avg(amount) as avg_amount from financial_data;

select category,SUM(amount) AS total_amount FROM financial_data GROUP BY category;

SELECT category, COUNT(*) AS total_transactions FROM financial_data GROUP BY category;

SELECT * FROM financial_data ORDER BY amount DESC;

SELECT * FROM financial_data ORDER BY amount DESC LIMIT 5;

SELECT * FROM financial_data
WHERE amount > (
    SELECT AVG(amount)
    FROM financial_data
);

SELECT *
FROM financial_data ft
WHERE amount = (
    SELECT MAX(amount)
    FROM financial_data
    WHERE category = ft.category
);

SELECT city, SUM(amount) AS total_amount
FROM financial_data
GROUP BY city
HAVING SUM(amount) > (
    SELECT 500000
);

//views
1)
CREATE VIEW monthly_summary AS
SELECT
    EXTRACT(MONTH FROM transaction_date) AS month,
    category,
    SUM(amount) AS total_amount,
    COUNT(*) AS total_transactions
FROM financial_data
GROUP BY month, category;

SELECT * FROM monthly_summary;
2)
CREATE VIEW high_value_transactions AS
SELECT *
FROM financial_data
WHERE amount > 75000;

select * from high_value_transactions;

3)
CREATE VIEW category_analysis AS
SELECT
    category,
    COUNT(*) AS total_transactions,
    AVG(amount) AS average_amount,
    MAX(amount) AS highest_amount,
    MIN(amount) AS lowest_amount
FROM financial_data
GROUP BY category;

select * from category_analysis;


//optimies and indexs
1)
CREATE INDEX idx_transaction_date
ON financial_data(transaction_date);

SELECT *
FROM financial_data
WHERE transaction_date BETWEEN '2024-01-01' AND '2024-06-30';

2)
CREATE INDEX idx_category_date
ON financial_data(category, transaction_date);

SELECT *
FROM financial_data
WHERE category = 'Food'
AND transaction_date > '2024-06-01';


