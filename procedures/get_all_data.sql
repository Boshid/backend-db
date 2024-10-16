create or replace function get_all_data(session_id_val int8)
returns setof data
language sql
begin atomic
    select * from data;
end;
