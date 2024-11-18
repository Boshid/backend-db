create or replace function get_task_executors(id_value int8)
returns setof task_executors
language sql
begin atomic
    select * from task_executors ex
    where ex.id = id_value;
end;
