declare not_found condition for sqlstate '02000';
declare at_end int default 0;

declare cur_InAsiData CURSOR FOR
select tx.orders_sn
from in_tx_orders tx
where and tx.tx_type = 'D';

declare continue handler for not_found set at_end = 1;

---------------------------------------------------------------------------------------

set at_end = 0;
open cur_InAsiData;
fetch cur_InAsiData into S_ORDERS_SN,D_RATIO,S_TX_TYPE,S_INVESTOR_CODE;
while at_end <> 1 do
    insert into in_tx_income_d (detail_uuid) values (S_ORDERS_SN);
    fetch cur_InAsiData into S_ORDERS_SN,D_RATIO,S_TX_TYPE,S_INVESTOR_CODE;
end while;
close cur_InAsiData;