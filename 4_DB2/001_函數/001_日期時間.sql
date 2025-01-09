-- 2024-05-09 10:24:01
select varchar_format(current timestamp, 'yyyy-mm-dd hh24:mi:ss') as current_time from sysibm.sysdummy1;
-- 2024-05-08
select char(current date, iso) from sysibm.sysdummy1;
-- 2024/05/08
select replace(char(current date, iso), '-', '/') from sysibm.sysdummy1;

-- 2024/7/17
select CURRENT DATE from sysibm.sysdummy1;
-- 2024/7/10
select CURRENT DATE - 7 DAYS from sysibm.sysdummy1;
-- 1
select DATE (REPLACE('2024/07/17','/','-')) > CURRENT DATE - 7 DAYS as result from sysibm.sysdummy1;

-- 11.17.45
select char(current time) from sysibm.sysdummy1;
-- 11:18:28
select replace(char(current time), '.', ':') from sysibm.sysdummy1;      

-- CHAR: This function is then used to convert the current date into a character string.
-- (CURRENT DATE, ISO): This part of the function specifies the format in which the date should be converted.
-- In this case, it's specified as ISO format.
-- ISO format represents dates as YYYY-MM-DD, which is widely accepted and used as a standard date format.
select current date from sysibm.sysdummy1;                               -- 2024/5/8
select (REPLACE('2024/07/17','/','-')) from sysibm.sysdummy1;            -- 2024-07-17
select DATE (REPLACE('2024/07/17','/','-')) from sysibm.sysdummy1;       -- 2024/7/17
select current time from sysibm.sysdummy1;                               -- 11:15:36 or 上午 11:18:51

-- 2024/05/21 17.07.19
select CHAR(REPLACE(CHAR(CURRENT DATE, ISO), '-', '/'), 10) || ' ' || CHAR(CHAR(CURRENT TIME), 8) as current_time
from sysibm.sysdummy1; 
---------------------------------------------------------------------------------------------------------------