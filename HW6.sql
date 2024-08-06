/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
DELIMITER $$
create function secToDays(n int)
returns varchar(250)
deterministic 

begin
declare d int default 0;
declare h int default 0;
declare m int default 0;
declare res varchar(250) default '';
    if n>-1 then
	    set d = n div 86400;
		set res = concat(d,' ','days ');
		set n = n % 86400;
		set h = n div 3600;
		set res = concat(res,' ',concat(h,' ','hours'));
		set n = n % 3600;
		set m = n div 60;
		set res = concat(res,' ',concat(m,' ','minutes'));
		set n = n % 60;
		set res = concat(res,' ',concat(n,' ','seconds'));
		return res;
	else
		return 'Нужны только положительные секунды!';
    end if;
    
end $$
DELIMITER ;

select secToDays(540366);

/*
2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
Задачу решать через процедуру
*/
DELIMITER $$
create procedure print_even(n int)
begin
    declare res  varchar(250) default '2';
    declare i int default 2;
    repeat
        set i = i + 2;
        if i<=n then
			set res = concat(res,',',i);
        end if;
		until i >= n 
    end repeat;
    select res;
end $$
DELIMITER ;

call print_even(10);
