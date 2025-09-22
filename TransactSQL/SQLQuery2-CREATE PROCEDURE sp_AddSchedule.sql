--SQLQuery2-CREATE PROCEDURE sp_SelectSchedule.sql
USE PD_321_HW;
GO
--------------------------------------------------------------------------------------------

ALTER PROCEDURE sp_AddSchedule
	@group_name				AS	NCHAR(10),
	@discipline_name		AS	NVARCHAR(150),
	@teacher_last_name		AS	NVARCHAR(50),
	@start_date				AS	DATE,
	@start_time				AS	TIME
AS
BEGIN
SET DATEFIRST	1;
	DECLARE	@group			AS	INT			=	(SELECT group_id			FROM Groups			WHERE group_name = @group_name);
	DECLARE	@discipline		AS	SMALLINT	=	(SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE @discipline_name);
	DECLARE	@lessons_count	AS	TINYINT		=	(SELECT	number_of_lessons	FROM Disciplines	WHERE discipline_id	= @discipline);
	DECLARE	@lesson_number	AS	TINYINT		=	1;
	DECLARE	@teacher		AS	INT			=	(SELECT teacher_id			FROM Teachers		WHERE last_name = @teacher_last_name);
	DECLARE @date			AS	DATE		=	@start_date;

	PRINT (@group);
	PRINT (@discipline);
	PRINT (@lessons_count);
	PRINT (@start_date);
	PRINT (@start_time);

	WHILE	@lesson_number <= @lessons_count
	BEGIN
		IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [group] = @group AND discipline = @discipline AND [date] = @date)
		BEGIN
			INSERT	Schedule	
					([group], discipline, teacher, [date], [time], spent)
			VALUES
					(@group, @discipline, @teacher, @date, @start_time, IIF(@date < GETDATE(),1,0)),
					(@group, @discipline, @teacher, @date, DATEADD(MINUTE,95,@start_time), IIF(@date < GETDATE(),1,0));
		END
		SET	@lesson_number	= @lesson_number+2;
		SET @date			=	DATEADD(DAY, IIF(DATEPART(WEEKDAY,@date)=5, 3, 2), @date);

	END
END