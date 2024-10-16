create or replace function get_additional(session_id int8, data_id int8)
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
    select additional_fields from get_additional_fields(data_id) into field_name_result;

    case field_name_result
        when field1_name then
            return query select a.id, a.field1 as field from additional a
            where a.id = data_id;
        when field2_name then
            return query select a.id, a.field2 as field from additional a
            where a.id = data_id;
        when field3_name then
            return query select a.id, a.field3 as field from additional a
            where a.id = data_id;
        else
            return query select a.id, null as field from additional a
            where a.id = data_id;
    end case;
end;
$$;
