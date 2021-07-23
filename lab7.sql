CREATE DATABASE lab7;

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    street_address varchar(255),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name varchar(50) UNIQUE,
    budget int,
    location_id int REFERENCES locations
);

CREATE TABLE employees (
    employee_id SERIAL primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary int,
    manager_id int REFERENCES employees,
    department_id int REFERENCES departments
);

CREATE TABLE job_grades (
    grade char(1),
    lowest_salary int,
    highest_salary int
);

SELECT E.first_name, E.last_name, D.department_id, L.city, L.state_province
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
JOIN locations L
ON D.location_id = L.location_id
WHERE E.last_name LIKE '%b%';

SELECT D.department_name , L.city , L.state_province
FROM  departments D
JOIN locations L
ON  D.location_id = L.location_id;

SELECT E.first_name AS "Employees", M.first_name AS "Managers"
FROM employees E
LEFT OUTER JOIN employees M
ON E.manager_id = M.employee_id;


SELECT j.grade, avg(salary) FROM employees e, job_grades j
WHERE e.salary BETWEEN j.lowest_salary AND highest_salary
GROUP BY j.grade;

SELECT first_name, last_name FROM employees
JOIN departments USING (department_id)
JOIN locations USING (location_id)
WHERE city = 'London';
