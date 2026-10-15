--q1 Find the top 5 states by customer count.

SELECT
    customer_state,
    COUNT(*) AS customer_count
FROM raw.customers
GROUP BY customer_state
ORDER BY customer_count DESC, customer_state
LIMIT 5;


--q2 Count unique customers using customer_unique_id.

SELECT
    COUNT(DISTINCT customer_unique_id) AS unique_customer_count
FROM raw.customers;


--q3 Find the most-used payment type and its total payment value.

SELECT
    payment_type,
    COUNT(*) AS payment_count,
    ROUND(SUM(payment_value)::numeric, 2) AS total_payment_value
FROM raw.order_payments
GROUP BY payment_type
ORDER BY payment_count DESC, total_payment_value DESC
LIMIT 1;

--q4  Count reviews for each score (1-5) and find the average score.

SELECT
    review_score,
    COUNT(*) AS review_count,
    ROUND(AVG(review_score) OVER (), 2) AS average_score
FROM raw.order_reviews
GROUP BY review_score
ORDER BY review_score;

--q5 Find seller states with more than 50 sellers.

SELECT
    seller_state,
    COUNT(*) AS seller_count
FROM raw.sellers
GROUP BY seller_state
HAVING COUNT(*) > 50
ORDER BY seller_count DESC, seller_state;

--q6 Calculate the average price and freight per item, rounded to 2 decimals.

SELECT
    ROUND(AVG(price)::numeric, 2) AS average_price,
    ROUND(AVG(freight_value)::numeric, 2) AS average_freight_value
FROM raw.order_items;





