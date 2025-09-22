--SQLQuery0-Calling Procedures.sql
SET DATEFIRST	1;
USE PD_321_HW;
GO
------------------------------------------------------------------------------------------------------
--DELETE FROM Schedule;
EXEC sp_AddSchedule N'PD_411', N'%MS SQL Server%', N'Ковтун', '2025-08-18', '13:30';
EXEC sp_SelectSchedule;