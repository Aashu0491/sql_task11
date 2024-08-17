select * from call_centre
select csat_score from call_centre order by csat_score desc
	
create or replace function score(csat_score int)
returns varchar as $$
declare
    output varchar;
begin
    case
        when csat_score < 5 then output := 'fail';
        when csat_score < 10 then output := 'pass';
        else output := 'excellent';
end case ;
return output;
end
$$ language plpgsql;
select score(csat_score)from call_centre

--2
create or replace function call(call_duration int)
returns varchar as $$
declare
    output varchar;
begin
    case
        when call_duration < 10 then output := 'excellent_call';
        when call_duration < 20 then output := 'good_call';
        when call_duration < 30 then output :='bad_call';
		when call_duration < 40 then output :='long_call';
        else output := 'too_long';
end case ;
return output;
end
$$ language plpgsql;
select call(call_duration),call_duration from call_centre

