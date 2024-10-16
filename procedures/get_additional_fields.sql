create or replace function get_additional_fields(session_id_val int8, employee_id_value int8)
returns table (
    id int8,
    name varchar
)
language sql
begin atomic
    select r.id, fn.name from roles r
        join fields_name fn on r.field_id = fn.id
        join employees e on r.id = e.role_id
        where e.role_id = employee_id_value;
end;
