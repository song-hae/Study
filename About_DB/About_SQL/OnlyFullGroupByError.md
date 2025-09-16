### Q.

`group by`에 `select`에서 찾는 거 다 안넣으면

(1055, "Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'programmers.ECOLI_DATA.ID' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by")
이거 뭐 어떡해야 하냐
무작정 `select`에서 찾는 컬럼명을 전부 `group by`에 때려박으면 되는건가? (이미 그랬음)

### A.

`only_full_group_by` 에러는 MySQL 기본 설정으로 논리적 모호함 방지를 위한 에러임.

[ex](//images/group_by.png)

집계함수를 사용하지 않는 컬럼의 경우 `group by`에 포함되지 않았을 때(ex. `ID`),
group으로 묶인 한 열(ex.`YEAR`) 내에서 집계함수를 사용하지 않는 컬럼의 값(ex. `ID`)은 그 컬럼내의 다양한 값 중 하나(ex.`101`, `250`, `312`)가 될 수 있기 때문에 이 모호함을 방지하고자
(1) 집계함수를 써서 값을 하나로 만들던가, (ex. `MAX(ID)`)
(2) group by 절에 넣어서 그 값별로도 group을 만들 수 있도록 하라는 거

이에 대한 해답은 결국
**`select` 절에서 `aggregate` 함수를 사용하지 않는 컬럼은 `group by` 절에 포함시키기.**
(or 그 컬럼에 집계 함수 쓰기)
