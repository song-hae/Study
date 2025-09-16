[Q](https://leetcode.com/problems/students-and-examinations/?envType=study-plan-v2&envId=top-sql-50)

유의할 점:
CROSS JOIN을 통해 카테시안곱을 생성하는 것은 두 릴레이션의 결합으로 나올 수 있는 모든 경우의 수를 생성함 (빈칸 NULL)
따라서 다른 조인처럼 ON 절로 따로 연결해줄 필요 없음.

이 문제의 경우 CROSS JOIN을 활용해 모든 경우의 수 테이블을 만든 후 LEFT JOIN을 활용해 필요한 부분을 남겨야 함

\+
CROSS JOIN 활용 -> 카테시안곱만큼의 릴레이션 생성. (간단히 두 릴레이션의 내용을 모두 포함한 테이블을 만드는거니까 ON을 통한 속성간 연결 필요 x)

[SQL](../SQL/1280_LeetCode.sql)
