create or replace procedure create_executor(session_id_val int8, name_value varchar, additional_id_value int8, employee_id_value int8, role_id_value int8)
language sql
begin atomic
    with inserted_executor_id as (
        insert into executor(name, additional_id, role_id)
        values (name_value, additional_id_value, role_id_value)
        on conflict do nothing
        returning id
    )
    insert into executor_employees(employee_id, executor_id)
    select employee_id_value, ins.id from inserted_executor_id ins
    on conflict do nothing;
end;