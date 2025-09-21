--SQLQuery3-SELECT Teachers.sql
USE PD_321_HW;
GO
------------------------------------------------------------------------------------------------------
SELECT
			[Ф.И.О.]				=	FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
			[Возраст]				=	CAST(DATEDIFF(DAY, birth_date, GETDATE())/365.25 AS INT),
			[Опыт преподавания]		=	CAST(DATEDIFF(DAY, work_since, GETDATE())/365.25 AS INT),
			[Количество дисциплин]	=	COUNT(discipline_id)

FROM		Teachers, Disciplines, TeachersDisciplinesRelation
WHERE		teacher		=	teacher_id
AND			discipline	=	discipline_id
--AND			CAST(DATEDIFF(DAY, birth_date, GETDATE())/365.25 AS INT) <= 40
GROUP BY	last_name, first_name, middle_name, birth_date, work_since
--HAVING		COUNT(discipline_id) > 5	AND	COUNT(discipline_id) < 10
HAVING		COUNT(discipline_id) BETWEEN 3 AND 5
ORDER BY	[Количество дисциплин]
;

PRINT(GETDATE());