create or replace function get_executor(session_id_val int8, id_value int8)
returns setof executor
language sql
begin atomic
    select * from executor ex
    where ex.id = id_value;
end;
