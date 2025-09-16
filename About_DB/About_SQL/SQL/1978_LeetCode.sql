# Write your MySQL query statement below
--1
SELECT employee_id
FROM Employees
WHERE salary < 30000 AND
manager_id not in (select employee_id from employees)
ORDER BY employee_id

--2
SELECT e1.employee_id
FROM Employees e1
LEFT JOIN Employees e2
On e1.manager_id = e2.employee_id
WHERE e1.salary < 30000 AND
e2.employee_id is null
ORDER BY employee_id

-- 3
SELECT e1.employee_id
FROM Employees e1
LEFT JOIN Employees e2
On e1.manager_id = e2.employee_id
WHERE e1.salary < 30000 AND
e1.manager_id is not null AND
e2.employee_id is null 
ORDER BY employee_id