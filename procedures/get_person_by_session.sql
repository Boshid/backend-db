create or replace function get_person_by_session(session_id_val int8)
returns table (
    id int8,
    name varchar
)
language plpgsql as $$
declare
    person_id int8;
begin
    select person_id from get_session(session_id_val) into person_id;
    select * from get_person(person_id);
end;
$$;