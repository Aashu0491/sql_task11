select * from customer
--1 function
create or replace function direction(region varchar)
returns varchar as $$
declare
    output varchar;
begin
    case
        when region = 'central' then output := 'middle';
        when region = 'east' then output := 'right'; 
        when region = 'west' then output := 'left';
        when region = 'north' then output := 'UP';
        else output := 'Down';
end case ;
return output;
end
$$ language plpgsql;

select direction(region) from customer where region = 'central'

--2
select distinct age from customer order by age desc
	
create or replace function age_rate(age int)
returns varchar as $$
declare
    output varchar;
begin
     case
         when age < 18 then output := 'teenager';
         when age < 50 then output := 'adult';
         else output := 'old';
end case;
return output;
end
$$ language plpgsql;

select age_rate(age) from customer where age = 18
select age_rate(age) from customer
--3
select * from sales
create or replace function mode(ship_mode varchar)
returns varchar as $$
declare 
	output varchar ;
begin
     case
         when ship_mode = 'first class' then output:= 'first_mode';
         when ship_mode = 'second class' then output:= 'second_mode';
         else output := 'standard_mode';
end case;
return output;
end
$$ language plpgsql;
 select mode(ship_mode) from sales where ship_mode = 'second class'

--4
select * from sales
create or replace function qty ( quantity int)
returns varchar as $$
declare 
	output varchar ;
begin
     case
         when quantity < 5  then output:= 'min qty' ;
         when quantity < 10 then output:= 'avg qty';
         else output := 'perfect qty';
end case;
return output;
end
$$ language plpgsql;
select qty(quantity),quantity from sales

--5
select * from product	
create or replace function category_name ( category varchar)
returns varchar as $$
declare 
	output varchar ;
begin
     case
         when category = 'furniture'  then output:= 'wood' ;
         when category = 'office supplies' then output:= 'office-essentials';
         else output := 'gadgets';
end case;
return output;
end
$$ language plpgsql;
select category_name(category),category from product
--3
create or replace function checksales(productId varchar)
returns varchar as $$
declare
	salesStatus varchar;
    sumofsales  float;
    begin
        select sum(sales) into sumofsales from sales where product_id = productId;
        if sumofSales > 500 then salesStatus := 'sales is good';
        else salesstatus:= 'sales not good';
        end if;
        return salesStatus;
   end;
$$ language plpgsql
	
DROP FUNCTION checksales
select sum(sales),product_id,checksales(product_id)from sales group by product_id