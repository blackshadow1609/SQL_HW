--SQLQuery1-INSERT.sql
USE PD_411_SQL_HW;
GO
-----------------------------------------------DIRECTIONS---------------------------------------------
---- �������� ������� ����� �������� ����� ������
--DELETE FROM Directions;

---- ������ ������
--INSERT INTO Directions (direction_id, direction_name)
--VALUES (1, N'���������� ������������ �����������');

---- ������ ������  
--INSERT INTO Directions (direction_id, direction_name)
--VALUES (2, N'������� ���������� � ��������� �����������������');

---- ������ ������
--INSERT INTO Directions (direction_id, direction_name)
--VALUES (3, N'������������ ������� � ������');

--SELECT * FROM Directions;
------------------------------------------------------------------------------------------------------
---------------------------------------------LEARNINGFORMS--------------------------------------------
INSERT LearningForms
		(form_id, form_name)
VALUES	(1, N'���������'),
		(2, N'�������������'),
		(3, N'�������� �����')
		;

SELECT * FROM	LearningForms;
------------------------------------------------------------------------------------------------------
-------------------------------------------------GROUPS-----------------------------------------------
--INSERT Groups
--		(group_id, group_name, direction)
