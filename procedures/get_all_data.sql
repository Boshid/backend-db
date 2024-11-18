create or replace function get_all_tasks(session_id_val int8)
returns setof task
language sql
begin atomic
    select * from task;
end;
