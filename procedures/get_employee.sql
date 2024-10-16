create or replace function get_person_by_session(session_id_val int8, device_id_val varchar)
returns setof int8
language plpgsql as $$
declare
    person_id_val int8;
begin
    select person_id from get_session(session_id_val, device_id_val) into person_id_val;
    return query select id from get_person(person_id_val);
end;
$$;