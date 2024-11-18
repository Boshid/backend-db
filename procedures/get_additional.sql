create or replace function get_duration(session_id int8, task_id int8)
returns table (
    id int8,
    field text
)
language plpgsql as $$
declare
    field1_name constant varchar := 'field1';
    field2_name constant varchar := 'field2';
    field3_name constant varchar := 'field3';
    field_name_result varchar;
begin
    select duration_fields from get_duration_fields(task_id) into field_name_result;

    case field_name_result
        when field1_name then
            return query select a.id, a.field1 as field from duration a
            where a.id = task_id;
        when field2_name then
            return query select a.id, a.field2 as field from duration a
            where a.id = task_id;
        when field3_name then
            return query select a.id, a.field3 as field from duration a
            where a.id = task_id;
        else
            return query select a.id, null as field from duration a
            where a.id = task_id;
    end case;
end;
$$;
