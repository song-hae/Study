CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    employee_name varchar(50)
    );
    
CREATE TABLE months(
	month_num INT PRIMARY KEY
    );
    
INSERT INTO employees (employee_id, employee_name) VALUES
(101,'haesong'),
(102,'sungsu'),
(103,'haecheol')
;

INSERT INTO months (month_num) VALUES
(1),(2),(3)
;

SELECT * 
FROM employees e
CROSS JOIN months m
;

CREATE TABLE employees_hier (
	employee_id INT PRIMARY KEY,
    employee_name varchar(50),
    manager_id INT
);

INSERT INTO employees_hier (employee_id, employee_name, manager_id) VALUES
(1, '사장님', NULL),
(2, '개발팀장', 1),
(3, '인사팀장', 1),
(4, '김대리', 2),
(5, '박사원', 4)
;

SELECT e1.employee_id as '사원', e1.manager_id as '직속 상사', e2.manager_id as '위의 위'
FROM employees_hier e1
LEFT JOIN employees_hier e2
ON e1.manager_id = e2.employee_id
LEFT JOIN employees_hier e3
ON e2.manager_id = e3.employee_id
;

SELECT 
	e1.employee_name as '사원', 
	e2.employee_name as '직속 상사', 
	e3.employee_name as '위의 위'
FROM 
	employees_hier e1
LEFT JOIN 
	employees_hier e2
ON 
	e1.manager_id = e2.employee_id
LEFT JOIN 
	employees_hier e3
ON 
	e2.manager_id = e3.employee_id
;

-- Recursive CTE
-- 새로운 테이블을 만드는건가? -> ㄴㄴ 가상의 테이블 (`employee_path`)를 만드는 거임(CTE)
WITH recursive employee_path (employee_id, employee_name, manager_id, level) AS ( 
SELECT
	employee_id,
    employee_name,
    manager_id,
    1 AS level
FROM
	employees_hier
WHERE
	employee_name = '박사원'

UNION ALL -- 얘 왜 씀? -> 위에 Anchor Member와 밑의 Recursive Member들을 연결하기 위함 (밑의 쿼리는 반복되면서 member가 여러 개가 됨)

SELECT
	e.employee_id,
    e.employee_name,
    e.manager_id,
	ep.level + 1
FROM
	employees_hier e
JOIN
	employee_path ep
ON
	e.employee_id = ep.manager_id
-- WHERE
-- ep.manager_id IS NOT NULL
-- 명시적으로 추가하지 않아도 되는 이유 -> JOIN에서 더 이상 연결할 게 없으면 쿼리가 정지하기 때문
)
SELECT * FROM employee_path;

