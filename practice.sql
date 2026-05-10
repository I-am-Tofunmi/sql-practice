-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    city VARCHAR(100)
);

-- Insert single row
INSERT INTO users (name, age, city)
VALUES ('Tofunmi', 17, 'Abeokuta');

-- Insert multiple rows
INSERT INTO users (name, age, city)
VALUES ('Charles', 25, 'Lagos'),
       ('Sean', 35, 'Abuja');

-- Select all rows
SELECT * FROM users;

-- Select with WHERE filter
SELECT * FROM users WHERE age > 20;

-- Select specific city
SELECT * FROM users WHERE city = 'Lagos';

-- Update a row
UPDATE users SET city = 'Lagos' WHERE name = 'Tofunmi';

-- Delete a row
DELETE FROM users WHERE name = 'Sean';

-- Order by age descending
SELECT * FROM users ORDER BY age DESC;

-- Limit results
SELECT * FROM users LIMIT 2;

-- Aggregates
SELECT COUNT(*) FROM users;
SELECT AVG(age) FROM users;
SELECT SUM(age) FROM users;
SELECT MIN(age) FROM users;
SELECT MAX(age) FROM users;

-- Create posts table
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    user_id INT
);

-- Insert posts
INSERT INTO posts (title, user_id)
VALUES ('My first post', 1),
       ('Learning SQL', 1),
       ('Hello World', 4);

-- INNER JOIN
SELECT users.name, posts.title
FROM users
JOIN posts ON users.id = posts.user_id;

-- LEFT JOIN
SELECT users.name, posts.title
FROM users
LEFT JOIN posts ON users.id = posts.user_id;

-- RIGHT JOIN
SELECT users.name, posts.title
FROM users
RIGHT JOIN posts ON users.id = posts.user_id;

-- FULL JOIN
SELECT users.name, posts.title
FROM users
FULL JOIN posts ON users.id = posts.user_id;

-- GROUP BY
SELECT city, COUNT(*)
FROM users
GROUP BY city;

-- HAVING
SELECT city, COUNT(*)
FROM users
GROUP BY city
HAVING COUNT(*) > 1;

-- Subquery
SELECT name FROM users
WHERE age = (SELECT MAX(age) FROM users);

-- CTE (Common Table Expression)
WITH city_counts AS (
    SELECT city, COUNT(*) as total
    FROM users
    GROUP BY city
)
SELECT * FROM city_counts WHERE total > 1;