create or replace procedure create_task_executors(name_value varchar, duration_id_value int8, employee_id_value int8, role_id_value int8)
language sql
begin atomic
    with inserted_executor_id as (
        insert into task_executors(name, duration_id, role_id)
        values (name_value, duration_id_value, role_id_value)
        on conflict do nothing
        returning id
    )
    insert into executor_employees(employee_id, executor_id)
    select employee_id_value, ins.id from inserted_executor_id ins
    on conflict do nothing;
end;