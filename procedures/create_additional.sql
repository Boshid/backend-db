create or replace procedure create_additional(session_id_val int8, data_id_value int8, additional_fields text[])
language sql
begin atomic
    insert into additional(data_id, field1, field2, field3)
    values (data_id_value, additional_fields[1], additional_fields[2], additional_fields[3])
    on conflict do nothing;
end;
