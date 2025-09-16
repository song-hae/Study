[Q](https://leetcode.com/problems/queries-quality-and-percentage/description/?envType=study-plan-v2&envId=top-sql-50)

SUM()과 COUNT()는 각각 다른 연산 방식을 가짐.

COUNT()의 경우 컬럼에서 NULL이 아닌 것의 개수를 셈.
-> SQL에서 조건식은 참이면 1, 거짓이면 0의 값을 가짐. (NULL이 아닌 0)
-> 따라서 COUNT(조건식)의 경우, 조건식에 대한 결과가 1 or 0이기에 컬럼 전체를 세게 됨 (COUNT(\*)과 같음)
-> 이는 식의 의도와 맞지 않음.

따라서 조건식을 통해 컬럼 내에서 해당 조건에 맞는 경우만 세고 싶은 경우 SUM()의 방식이 더 알맞음.
-> SUM(조건식)은 참인 경우 1, 거짓인 경우 0을 다 더하기 때문에 참의 개수만 구할 수 있음
-> 따라서 식의 의도에 적합함.

그럼 COUNT()로는 어케 구함? CASE 문 활용
COUNT(CASE WHEN 조건식 THEN 1 ELSE NULL END)
사용하면 됨. 하지만 SUM()이 더 가독성, 효율 측면에서 우수함.

![SQL](../SQL/1211_LeetCode.sql)
