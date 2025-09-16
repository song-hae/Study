[Q](https://leetcode.com/problems/employees-whose-manager-left-the-company/?envType=study-plan-v2&envId=top-sql-50)

-- 1
Q. manager_id가 null인 경우를 제외하고 생각해야 함.
manager_id가 null인 경우 아예 Not in 연산을 하지 않아서 제외할 수 있을 거 같은데?

A. 이런 경우 Null을 비교 불가능한 값으로 보기에 null과 관련된 연산은 T or F가 아닌 Unknown이 됨. (False와 함께 걸러짐)
이는 의도했다기 보단 우연의 일치 (쿼리의 진행에 모호함이 있음)

쿼리의 모호함을 없애기 위해 자체 Left Join을 통한 쿼리로 변경할 수 있음.

--2
근데 이는 또 manager_id가 null인 경우를 제외하고 생각하지 못함.
(즉, manager_id가 애초에 null인 것과 퇴사한 manager_id인 것을 구분 못함)

따라서,

--3
이 되어야 함. (근데 실행해보니 개느리네..)

![SQL](../SQL/1978_LeetCode.sql)
