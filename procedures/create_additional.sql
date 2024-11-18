create or replace procedure create_duration(task_id_value int8, duration_fields text[])
language sql
begin atomic
    insert into duration(task_id, field1, field2, field3)
    values (task_id_value, duration_fields[1], duration_fields[2], duration_fields[3])
    on conflict do nothing;
end;
