COALESCE(c1, 10)
---------------------------------------------------------------------------------------------------------------
如果c1的值為:
5     回傳 5
NULL  回傳 10
'AB'  回傳錯誤 因為兩個表示式的資料類型不相容
---------------------------------------------------------------------------------------------------------------
select COALESCE(5, 10) from SYSIBM.SYSDUMMY1;    -- 5
select COALESCE(null, 10) from SYSIBM.SYSDUMMY1; -- 10
select COALESCE('AB', 10) from SYSIBM.SYSDUMMY1; -- 噴錯
---------------------------------------------------------------------------------------------------------------
coalesce(u.fin_send_date, '')
= case when u.fin_send_date is not null then u.fin_send_date else '' end

coalesce(d.except_pay_date, l.except_pay_date)
= case when d.except_pay_date is null then l.except_pay_date else d.except_pay_date end

replace(coalesce(u.fin_send_date, ''), '/', '')
= case when u.fin_send_date is null then '' else substr(replace(u.fin_send_date, '/', ''),1,8) end
---------------------------------------------------------------------------------------------------------------