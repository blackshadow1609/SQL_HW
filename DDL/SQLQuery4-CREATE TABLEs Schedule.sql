--SQLQuery4-CREATE TABLEs Schedule.sql
USE PD_411_SQL_HW;
GO

CREATE TABLE Schedule
(
	lesson_id		BIGINT			PRIMARY KEY,
	[date]			DATE			NOT NULL,
	[time]			TIME			NOT NULL,
	[group]			INT				NOT NULL

	CONSTRAINT	FK_Schedule_Groups		FOREIGN KEY	REFERENCES	Groups(group_id),

	discipline		INT				NOT NULL

	CONSTRAINT	FK_Schedule_Disciplines	FOREIGN KEY	REFERENCES	Disciplines(discipline_id),

	teacher			INT				NOT NULL

	CONSTRAINT	FK_Schedule_Teachers	FOREIGN KEY	REFERENCES	Teachers(teacher_id),

	[status]		BIT				NOT NULL,
	[subject]		NVARCHAR(256)	
);
------------------------------------------------------------------------------------------
CREATE TABLE Grades
(
	student			INT,
	lesson			BIGINT,

	PRIMARY KEY(student, lesson),

	CONSTRAINT	FK_Grades_Students	FOREIGN KEY (student)	REFERENCES	Students(student_id),
	CONSTRAINT	FK_Grades_Schedule	FOREIGN KEY (lesson)	REFERENCES	Schedule(lesson_id),

	grade_1			TINYINT

	CONSTRAINT	CK_Grade_1	CHECK (grade_1 > 0 AND grade_1 <= 12),

	grade_2			TINYINT

	CONSTRAINT	CK_Grade_2	CHECK (grade_2 > 0 AND grade_2 <= 12)
);
------------------------------------------------------------------------------------------