# Write your MySQL query statement below
SELECT query_name, ROUND(AVG(rating/position),2) as quality, ROUND(SUM(rating<3)*100/COUNT(*),2) as poor_query_percentage
FROM Queries q
GROUP BY query_name