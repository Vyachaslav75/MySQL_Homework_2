USE lesson2;

-- задание 1
-- Cоздаём таблицу
CREATE TABLE sales (
	id SERIAL PRIMARY KEY,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    count_product INT UNSIGNED
);

-- Заполняем таблицу данными
INSERT INTO sales (order_date, count_product) VALUES
  ('2022-01-01', 156),
  ('2022-01-02', 180),
  ('2022-01-03', 21),
  ('2022-01-04', 124),
  ('2022-01-05', 341);

-- Проверяем данные
SELECT * FROM sales;

-- задание 2

SELECT
	id AS "id заказа",
    CASE
	WHEN count_product < 100 THEN "Маленький заказ"
    WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
    WHEN count_product > 300 THEN "Большой заказ"
    ELSE "Ошибка"
END AS "Тип заказа"
FROM sales;

-- задание 3

CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
    employee_id VARCHAR(30) NOT NULL,
    amount DECIMAL(10,2),
    order_status VARCHAR(30) NOT NULL
);

-- Заполняем таблицу данными
INSERT INTO orders (employee_id, amount, order_status) VALUES
  ('e03', 15.00, 'OPEN'),
  ('e01', 25.50, 'OPEN'),
  ('e05', 100.70, 'CLOSED'),
  ('e02', 22.18, 'OPEN'),
  ('e04', 9.50, 'CANCELLED');

-- Проверяем данные
SELECT * FROM orders;

SELECT
	id, employee_id, amount, order_status,
    CASE
	WHEN order_status = 'OPEN' THEN "Order is in open state"
    WHEN order_status = 'CLOSED' THEN "Order is closed"
    WHEN order_status = 'CANCELLED' THEN "Order is cancelled"
    ELSE "Error"
END AS "full_order_status"
FROM orders;

