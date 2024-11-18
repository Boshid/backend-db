create or replace procedure create_task(val int8[])
language sql
begin atomic
    select * from get_session(session_id_val)
    insert into task values (unnest(val))
    on conflict do nothing;
end;
