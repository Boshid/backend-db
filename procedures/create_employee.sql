create or replace procedure create_employee(person_id_value int8, role_id_value int8)
language sql
begin atomic
    insert into employees(person_id, role_id)
    values (person_id_value, role_id_value)
    on conflict do nothing;
end;
