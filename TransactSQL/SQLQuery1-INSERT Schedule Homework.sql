USE PD_321_HW;
GO

-- 1. Вставляем предоставленное расписание из файла
INSERT INTO Schedule (group_id, discipline, lesson_date, start_time, teacher)
SELECT 
    (SELECT group_id FROM Groups WHERE group_name = N'PD_411'), -- Ваша группа
    d.discipline_id,
    CAST(event_date AS DATE),
    '13:30', -- Стандартное время начала
    CASE 
        WHEN teacher_name LIKE N'%Свищев%' THEN (SELECT teacher_id FROM Teachers WHERE last_name = N'Свищев')
        WHEN teacher_name LIKE N'%Амелькин%' THEN (SELECT teacher_id FROM Teachers WHERE last_name = N'Амелькин')
        WHEN teacher_name LIKE N'%Ефимов%' THEN (SELECT teacher_id FROM Teachers WHERE last_name = N'Ефимов')
        WHEN teacher_name LIKE N'%Ковтун%' THEN (SELECT teacher_id FROM Teachers WHERE last_name = N'Ковтун')
    END
FROM (VALUES
    ('2024-08-27', N'Основы Информационных технологий', N'Свищев Алексей Викторович'),
    ('2024-08-29', N'Основы Информационных технологий', N'Свищев Алексей Викторович'),
    -- ... все остальные записи из расписания ...
    ('2025-07-25', N'Основы разработки приложений с использованием Windows Forms и WPF', N'Ковтун Олег Анатольевич')
) AS ScheduleData(event_date, discipline_name, teacher_name)
JOIN Disciplines d ON d.discipline_name = ScheduleData.discipline_name
WHERE NOT EXISTS (
    SELECT 1 FROM Schedule s 
    WHERE s.group_id = (SELECT group_id FROM Groups WHERE group_name = N'PD_411')
    AND s.discipline = d.discipline_id
    AND s.lesson_date = CAST(ScheduleData.event_date AS DATE)
);

PRINT 'Расписание из файла добавлено';
GO

-- 2. Добавляем расписание для дисциплин от 'ООП на C++' до 'MS SQL Server'
DECLARE @group AS INT = (SELECT group_id FROM Groups WHERE group_name = N'PD_411');
DECLARE @start_date DATE = '2025-01-28'; -- Начало ООП на C++
DECLARE @current_date DATE = @start_date;

-- Для каждой дисциплины создаем расписание
DECLARE discipline_cursor CURSOR FOR
SELECT discipline_id, number_of_lessons 
FROM Disciplines 
WHERE discipline_id BETWEEN 
    (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'%ООП на C++%') 
    AND 
    (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'%MS SQL Server%')
ORDER BY discipline_id;

DECLARE @discipline_id SMALLINT, @lessons_count TINYINT;

OPEN discipline_cursor;
FETCH NEXT FROM discipline_cursor INTO @discipline_id, @lessons_count;

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @lesson_number INT = 1;
    DECLARE @teacher_id INT = (
        SELECT teacher_id FROM Teacher_Disciplines 
        WHERE discipline = @discipline_id
    );
    
    SET @current_date = CASE 
        WHEN @discipline_id = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'%ООП на C++%')
        THEN '2025-01-28'
        ELSE DATEADD(DAY, 7, @current_date) -- Начинаем следующую дисциплину через неделю
    END;
    
    WHILE @lesson_number <= @lessons_count
    BEGIN
        -- Пропускаем выходные (суббота и воскресенье)
        WHILE DATEPART(WEEKDAY, @current_date) IN (6, 7)
        BEGIN
            SET @current_date = DATEADD(DAY, 1, @current_date);
        END;
        
        INSERT INTO Schedule (group_id, discipline, lesson_date, start_time, teacher)
        VALUES (@group, @discipline_id, @current_date, '13:30', @teacher_id);
        
        SET @lesson_number = @lesson_number + 1;
        SET @current_date = DATEADD(DAY, 1, @current_date);
    END;
    
    FETCH NEXT FROM discipline_cursor INTO @discipline_id, @lessons_count;
END;

CLOSE discipline_cursor;
DEALLOCATE discipline_cursor;

PRINT 'Расписание для дисциплин от ООП на C++ до MS SQL Server добавлено';
GO

-- 3. Добавляем расписание для Базового семестра по схеме 12-21
DECLARE @group AS INT = (SELECT group_id FROM Groups WHERE group_name = N'PD_411');
DECLARE @start_date DATE = '2024-09-01'; -- Начало базового семестра
DECLARE @current_date DATE = @start_date;

-- Для каждой дисциплины базового семестра
DECLARE discipline_cursor CURSOR FOR
SELECT discipline_id, number_of_lessons 
FROM Disciplines 
WHERE semester = 1 -- Базовый семестр
ORDER BY discipline_id;

DECLARE @discipline_id SMALLINT, @lessons_count TINYINT;

OPEN discipline_cursor;
FETCH NEXT FROM discipline_cursor INTO @discipline_id, @lessons_count;

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @lesson_number INT = 1;
    DECLARE @teacher_id INT = (
        SELECT teacher_id FROM Teacher_Disciplines 
        WHERE discipline = @discipline_id
    );
    
    WHILE @lesson_number <= @lessons_count
    BEGIN
        -- Схема 12-21: занятия с 12:00 до 21:00 с перерывом
        IF NOT EXISTS (
            SELECT 1 FROM Schedule 
            WHERE group_id = @group 
            AND lesson_date = @current_date 
            AND discipline = @discipline_id
        )
        BEGIN
            -- Первая пара
            INSERT INTO Schedule (group_id, discipline, lesson_date, start_time, teacher)
            VALUES (@group, @discipline_id, @current_date, '12:00', @teacher_id);
            
            -- Вторая пара (после перерыва)
            INSERT INTO Schedule (group_id, discipline, lesson_date, start_time, teacher)
            VALUES (@group, @discipline_id, @current_date, '15:30', @teacher_id);
        END;
        
        SET @lesson_number = @lesson_number + 2; -- Добавляем по две пары в день
        SET @current_date = DATEADD(DAY, 1, @current_date);
        
        -- Пропускаем выходные
        WHILE DATEPART(WEEKDAY, @current_date) IN (6, 7)
        BEGIN
            SET @current_date = DATEADD(DAY, 1, @current_date);
        END;
    END;
    
    FETCH NEXT FROM discipline_cursor INTO @discipline_id, @lessons_count;
END;

CLOSE discipline_cursor;
DEALLOCATE discipline_cursor;

PRINT 'Расписание для базового семестра по схеме 12-21 добавлено';
GO