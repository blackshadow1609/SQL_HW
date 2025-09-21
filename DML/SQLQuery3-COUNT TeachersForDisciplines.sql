--SQLQuery3-COUNT TeachersForDisciplines.sql
USE PD_321_HW;
GO
------------------------------------------------------------------------------------------------------
SELECT
			[Дисциплина]					=	discipline_name,
			[Количество преподавателей]		=	COUNT(teacher)
--FROM		Teachers, Disciplines, TeachersDisciplinesRelation
--WHERE		teacher		=	teacher_id
--AND		discipline	=	discipline_id
FROM		Disciplines
LEFT JOIN	TeachersDisciplinesRelation		ON	(discipline	=	discipline_id)
--LEFT JOIN	Teachers						ON	(teacher	=	teacher_id)
GROUP BY	discipline_name
HAVING		COUNT(teacher)	=	0
;

SELECT	*	FROM	Disciplines;
------------------------------------------------------------------------------------------------------