--SQLQuery1-CREATE TABLEs StudentsBranch.sql
USE PD_411_SQL_HW;
------------------------------------------------------------------------------------------
CREATE TABLE Directions
(
	direction_id		TINYINT			PRIMARY KEY,
	direction_name		NVARCHAR(256)	NOT NULL
);
------------------------------------------------------------------------------------------
CREATE TABLE Groups
(
	group_id			INT				PRIMARY KEY,
	group_name			NVARCHAR(16)	NOT NULL,
	direction			TINYINT			NOT NULL

	CONSTRAINT	FK_Groups_Directions	FOREIGN	KEY	REFERENCES	Directions(direction_id)
);
------------------------------------------------------------------------------------------
CREATE TABLE Students
(
	student_id			INT				PRIMARY KEY,
	last_name			NVARCHAR(150)	NOT NULL,
	first_name			NVARCHAR(150)	NOT NULL,
	middle_name			NVARCHAR(150),
	birth_date			DATE			NOT NULL,
	[group]				INT				NOT NULL

	CONSTRAINT	FK_Students_Groups	FOREIGN	KEY	REFERENCES	Groups(group_id)
);
------------------------------------------------------------------------------------------
