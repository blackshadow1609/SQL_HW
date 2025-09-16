--SQLQuery3-CREATE TABLEs Disciplines.sql
USE PD_411_SQL_HW;
GO

--CREATE TABLE Disciplines
--(
--	discipline_id			INT				PRIMARY KEY,
--	discipline_name			NVARCHAR(256)	NOT NULL,
--	number_of_lessons		TINYINT			NOT NULL,
--);
------------------------------------------------------------------------------------------
--CREATE TABLE TeachersDisciplinesRelation
--(
--	teacher			INT,
--	discipline		INT,

--	PRIMARY KEY		(teacher, discipline),

--	CONSTRAINT		FK_TDR_Teachers		FOREIGN KEY	(teacher)		REFERENCES	Teachers(teacher_id),
--	CONSTRAINT		FK_TDR_Disciplines	FOREIGN KEY	(discipline)	REFERENCES	Disciplines(discipline_id)
--);
------------------------------------------------------------------------------------------
--CREATE TABLE DisciplinesDirectionsRelation
--(
--	discipline		INT,
--	direction		TINYINT,

--	PRIMARY KEY		(discipline, direction),

--	CONSTRAINT		FK_DDR_Disciplines	FOREIGN KEY	(discipline)	REFERENCES	Disciplines(discipline_id),
--	CONSTRAINT		FK_DDR_Directions	FOREIGN KEY	(direction)		REFERENCES	Directions(direction_id)
--);
------------------------------------------------------------------------------------------
--CREATE TABLE DependentDisciplines
--(
--	discipline					INT,
--	dependent_discipline		INT,

--	PRIMARY KEY		(discipline, dependent_discipline),

--	CONSTRAINT		FK_DD_Discipline_2_Disciplines_Relation	FOREIGN KEY	(discipline)			REFERENCES	Disciplines(discipline_id),
--	CONSTRAINT		FK_DD_Dependent_2_Discipline_Relation	FOREIGN KEY	(dependent_discipline)	REFERENCES	Disciplines(discipline_id)
--);
------------------------------------------------------------------------------------------
CREATE TABLE RequiredDisciplines
(
	discipline					INT,
	required_discipline			INT,

	PRIMARY KEY		(discipline, required_discipline),

	CONSTRAINT		FK_RD_Discipline_2_Disciplines_Relation	FOREIGN KEY	(discipline)			REFERENCES	Disciplines(discipline_id),
	CONSTRAINT		FK_RD_Required_2_Disciplines_Relation	FOREIGN KEY	(required_discipline)	REFERENCES	Disciplines(discipline_id)
);
------------------------------------------------------------------------------------------