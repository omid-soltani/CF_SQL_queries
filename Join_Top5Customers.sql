-- Here's a query for a query to find the top 5 customers from the top 10 cities who’ve paid the highest total amounts to Rockbuster
SELECT
	customer.customer_id,
	customer.first_name,
	customer.last_name,
	country.country,
	city.city,
	SUM(payment.amount) AS total_amount_paid
FROM
	customer
JOIN
	payment ON customer.customer_id = payment.customer_id
JOIN
	address ON customer.address_id = address.address_id
JOIN
	city ON address.city_id = city.city_id
JOIN
	country ON city.country_id = country.country_id
WHERE
	city.city IN ('Aurora', 'London', 'Abu Dhabi', 'Adana', 'Addis Abeba')
GROUP BY
	customer.customer_id, customer.first_name, customer.last_name, country.country, city.city
ORDER BY
	total_amount_paid DESC
LIMIT
	5;