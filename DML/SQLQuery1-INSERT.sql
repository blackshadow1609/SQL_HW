--SQLQuery1-INSERT.sql
USE PD_411_SQL_HW;
GO
-----------------------------------------------DIRECTIONS---------------------------------------------
---- Очистить таблицу перед вставкой новых данных
--DELETE FROM Directions;

---- Первая запись
--INSERT INTO Directions (direction_id, direction_name)
--VALUES (1, N'Разработка программного обеспечения');

---- Вторая запись  
--INSERT INTO Directions (direction_id, direction_name)
--VALUES (2, N'Сетевые технологии и системное администрирование');

---- Третья запись
--INSERT INTO Directions (direction_id, direction_name)
--VALUES (3, N'Компьютерная графика и дизайн');

--SELECT * FROM Directions;
------------------------------------------------------------------------------------------------------
---------------------------------------------LEARNINGFORMS--------------------------------------------
INSERT LearningForms
		(form_id, form_name)
VALUES	(1, N'Стационар'),
		(2, N'Полустационар'),
		(3, N'Годичные курсы')
		;

SELECT * FROM	LearningForms;
------------------------------------------------------------------------------------------------------
-------------------------------------------------GROUPS-----------------------------------------------
--INSERT Groups
--		(group_id, group_name, direction)
