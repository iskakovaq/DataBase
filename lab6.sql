CREATE TABLE departments(
    id INT PRIMARY KEY,
    dep_name TEXT NOT NULL
);

CREATE TABLE employees(
    id INT,
    fake_id INT,
    email VARCHAR(50),
    emp_name VARCHAR(50),
    birth_date DATE CHECK (birth_date > '1900-01-01'),
    salary INT,
    bonus INT,
    department_id INT,
    PRIMARY KEY  (id, fake_id),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

ALTER TABLE employees ADD CONSTRAINT Exc UNIQUE (email, emp_name);

INSERT INTO departments VALUES (1, 'department'), (2, 'department');


ALTER TABLE employees
DROP CONSTRAINT employees_birth_date_check;

ALTER TABLE employees
ADD CHECK (bonus > 0 AND salary > 0 AND salary > 0);

ALTER TABLE employees
DROP CONSTRAINT employees_pkey;

ALTER TABLE departments
ALTER COLUMN dep_name SET NOT NULL;