--SQLQuery2-CREATE TABLE Teachers.sql
USE PD_411_SQL_HW;
GO

CREATE TABLE Teachers
(
	teacher_id			INT				PRIMARY KEY,
	last_name			NVARCHAR(150)	NOT NULL,
	first_name			NVARCHAR(150)	NOT NULL,
	middle_name			NVARCHAR(150),
	birth_date			DATE			NOT NULL,
	work_since			DATE			NOT NULL
);