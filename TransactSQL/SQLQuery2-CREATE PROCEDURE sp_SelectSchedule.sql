--SQLQuery2-CREATE PROCEDURE spAddSchedule.sql
USE PD_321_HW;
GO
--------------------------------------------------------------------------------------------
ALTER PROCEDURE sp_SelectSchedule 
AS
BEGIN
	SELECT
			[ID]			=	lesson_id,
			[������]		=	group_name,
			[����������]	=	discipline_name,
			[�������������]	=	FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
			[���� ������]	=	DATENAME(WEEKDAY, [date]),
			[����]			=	[date],
			[�����]			=	[time],
			[������]		=	IIF(spent=1, N'���������', N'�������������')

	FROM	Schedule, Teachers, Groups, Disciplines
	WHERE	[group]			=	group_id
	AND		discipline		=	discipline_id
	AND		teacher			=	teacher_id
	;
END