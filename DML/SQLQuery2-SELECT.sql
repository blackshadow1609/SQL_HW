--SQLQuery2-SELECT.sql
USE PD_321_HW;
GO
------------------------------------------------------------------------------------------------------
--SELECT	
--		direction_id		AS		N'Номер направления',
--		direction_name		AS		N'Название'
--FROM	Directions;
------------------------------------------------------------------------------------------------------
--INSERT	Groups
--			(group_id, group_name, direction, learning_form)
--VALUES	(7, N'SU_411', 2, 1);
--------------------------------------------------------------------------------------------------------
--SELECT
--		group_name			AS		N'Название группы',
--		direction_name		AS		N'Направление обучения'
--FROM	Groups, Directions
--WHERE	direction			=	direction_id
--AND		direction_name		LIKE(N'Сетевые технологии%')
--;
------------------------------------------------------------------------------------------------------
--SELECT
--		last_name	+	''	+	first_name+	''	+	middle_name	AS	N'Студент',
--		group_name												AS	N'Группа',
--		direction_name											AS	N'Направление обучения'
--FROM	Students, Groups, Directions
--WHERE	[group]		=	group_id
--AND		direction	=	direction_id
--;
------------------------------------------------------------------------------------------------------
--SELECT
--		COUNT(stud_id)	AS N'Количество студентов' 
--FROM Students;
------------------------------------------------------------------------------------------------------
--------------------------------Количество студентов в каждой группе----------------------------------
PRINT N'=== Количество студентов в каждой группе ==='
SELECT
    group_name AS N'Группа',
    COUNT(stud_id) AS N'Количество студентов'
FROM Students
JOIN Groups ON [group] = group_id
GROUP BY group_name
ORDER BY group_name;

PRINT N''

-----------------------------Количество студентов на каждом направлении-------------------------------
PRINT N'=== Количество студентов на каждом направлении ==='
SELECT
    direction_name AS N'Направление обучения',
    COUNT(stud_id) AS N'Количество студентов'
FROM Students
JOIN Groups ON [group] = group_id
JOIN Directions ON direction = direction_id
GROUP BY direction_name
ORDER BY direction_name;
------------------------------------------------------------------------------------------------------